require 'minitest/autorun'

class NilTest < MiniTest::Test
  def test_nil
    value = 3
    assert_nil(value)
  end
end