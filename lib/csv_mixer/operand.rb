# This is to describe the operands of CSV mixer.
# You have to supply the filename.
# 
# 
require 'csv'

class CsvMixer::Operand
  OPTIONS = { headers: true, header_converters: :symbol }

  def initialize(file_name)
    @file_name = file_name.to_s
    if @file_name=='' or (not File.exists? @file_name)
      # Error
    end
  end

  # Use primitive CSV objects to get the descriptor of this operand
  def io;  @io ||= File.open @file_name, 'rb'; end
  def close; io.close unless io.nil?; end

  def first_line
    @first_line ||= File.open(@file_name, &:gets).to_s
  end

  # regels, woorden, tekens, bytes, maximum regellengte
  def stat
    return @stat unless @stat.nil?
    cmd = "wc -l -L -m -c #{@file_name}"
    @lines, @chars, @bytes, @max_line =
      `#{cmd}`.chomp.split(/s+/)[1..4].map(&:to_i)
    @stat = {lines: @lines, chars: @chars, bytes: @bytes, max_line: @max_line}
  end

  # Columns descriptors
  def header; @header ||= CSV.parse(first_line); end
  def columns_size; @columns_size ||= header.size; end
  def header_size; @header_size ||= columns_size - 1; end
  def index_of(col); i = header.index(col); i.nil? ? header_size : i; end
end
