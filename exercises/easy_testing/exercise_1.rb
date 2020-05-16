require 'minitest/autorun'

class BooleanTest < MiniTest::Test
  def test_boolean
    value = 6
    assert(value.odd?, 'value is not odd')
  end
end