require 'minitest/autorun'

class SameTest < Minitest::Test
  def test_same
    list = []
    assert_same list, list.process
  end
end