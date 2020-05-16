require 'minitest/autorun'

class TypeTest < Minitest::Test
  def test_type
    value = 5.6
    assert_instance_of Numeric, value
  end
end