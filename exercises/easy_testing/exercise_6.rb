require 'minitest/autorun'

class ExceptionTest < MiniTest::Test
  def test_exception
    assert_raises NoExperienceError { employee.hire }
  end
end