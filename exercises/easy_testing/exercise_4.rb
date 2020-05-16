require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class EmptyTest < MiniTest::Test
  def test_empty
    list = []
    assert_empty(list)
  end
end