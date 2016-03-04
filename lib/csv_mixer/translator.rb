class CsvMixer::Translator
  def initialize(language = "english")
    @language = language
  end

  def hi
    case @language
    when "dutch"
      "hallo wereld"
    when "spanish"
      "hola mundo"
    when "korean"
      "anyoung ha se yo"
    else
      "hello world"
    end
  end
end
