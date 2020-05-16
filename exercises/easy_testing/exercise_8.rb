require 'minitest/autorun'

class KindTest < Minitest::Test
  def test_kind
    value = 'hello'
    assert_kind_of Numeric, value
  end
end