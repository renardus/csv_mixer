class CsvMixer
  def self.hi(language)
    translator = Translator.new(language)
    translator.hi
  end
end

$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'csv_mixer/translator'
