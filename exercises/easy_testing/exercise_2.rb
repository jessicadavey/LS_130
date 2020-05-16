require 'minitest/autorun'

class EqualityTest < MiniTest::Test
  def test_downcase
    value = 'XY'
    assert_equal('xyz', value.downcase, "Downcase test failed")
  end
end