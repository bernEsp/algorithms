class Fibonacci
  def initialize
    @fib_serie   = [0,1]
  end

  def fib(position)
    ( 2 .. position).each do |pos|
      @fib_serie << @fib_serie[pos-2].to_i + @fib_serie[pos-1].to_i
    end
    @fib_serie[position]
  end

end
