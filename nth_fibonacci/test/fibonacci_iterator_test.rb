require 'minitest/autorun'
require './lib/fibonacci_iterator'

class FibonacciIteratorTest < Minitest::Test
  def setup
    @fibonacci = FibonacciIterator.new
  end

  def test_that_fib_method_return_the_nth_number
    n = 20
    assert_equal 6765, @fibonacci.fib(n)
  end
end
