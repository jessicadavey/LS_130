require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test
  def setup
    @register = CashRegister.new(100)
    @transaction = Transaction.new(10)
  end

  def test_accept_money
    @transaction.amount_paid = 10
    @register.accept_money(@transaction)

    assert_equal(110, @register.total_money)
  end

  def test_change
    @transaction.amount_paid = 50

    change = @register.change(@transaction)
    assert_equal(40, change)
  end

  def test_give_receipt
    output = "You've paid $10.\n"
    assert_output(output, "") { @register.give_receipt(@transaction)}
  end

  def test_prompt_for_payment
    @transaction.prompt_for_payment
    assert_equal(50, @transaction.amount_paid)
  end
end