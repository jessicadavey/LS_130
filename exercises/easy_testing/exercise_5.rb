require 'minitest/autorun'

class IncludeTest < MiniTest::Test
  def test_include
    list = ['xyz', '123', 7]
    assert_includes(list, 'xyz')
  end
end