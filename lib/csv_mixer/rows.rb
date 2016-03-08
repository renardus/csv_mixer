# This is to add the rows in files into a new file.
# You have to supply the input filenames and the result filename
# The filenames etc. should be handled in an own class and only the operands should be used here.
# Because the addition is communitative and associative a sequence of additions can be handled
# in one operand sum.
require 'csv'
require 'set'

class CsvMixer::Rows
  def initialize(file_names=[], resultant)
    @file_names = file_names
    @resultant  = resultant
  end

  def first_lines
    @first_lines ||= @file_names.map {|name| File.open(name, &:gets).to_s }
  end

  def headers
    @headers ||= @first_lines.map { |line| CSV.parse(line) }
  end

  def header
    @header ||= headers.inject(Set.new([])) { |sum, head| sum += Set.new(head) }.to_a
  end

  def header_size; @header_size ||= header.size; end
  def header_length; @header_length ||= header.size - 1; end
  def submap(col); i = header.index(col); i.nil? ? header_size : i; end
  def mapper; @mapper ||= headers.map{|head| head.map {|col| submap(col)}}; end

  def rearranged(i, row); (0..header_length).map { |j| row[mapper[i][j]] }; end 
  def add(csv)
    @file_names.each_with_index do |name, i|
      CSV.foreach(name) do |row|
        csv << rearranged(i, row)
      end
    end
  end

  def sum
    CSV.open(resultant, 'wb') do |csv|
      add(csv)
    end
  end
end
