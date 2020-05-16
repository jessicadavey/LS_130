require 'minitest/autorun'

class RefuteTest < MiniTest::Test
  def test_refute
    list = [5, 6, 7, 'xyz']
    refute_includes list, 'xyz'
  end
end