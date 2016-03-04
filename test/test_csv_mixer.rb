require 'test/unit'
require 'csv_mixer'

class CsvMixerTest < Test::Unit::TestCase
  def test_english_hello
    assert_equal "hello world", CsvMixer.hi("english")
  end

  def test_any_hello
    assert_equal "hello world", CsvMixer.hi("ruby")
  end

  def test_spanish_hello
    assert_equal "hola mundo", CsvMixer.hi("spanish")
  end
end
