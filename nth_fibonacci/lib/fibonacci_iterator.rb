class FibonacciIterator
  def initialize
    @fib = Enumerator.new do |y|
      a = 0
      b = 1
      loop do
        y << a
        a, b = b, a + b
      end
    end
  end

  def fib(position)
    @fib.take(position+1).last
  end
end
