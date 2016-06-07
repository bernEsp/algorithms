class FibonacciDynamic
  def initialize
    @result   = 0
    @current_num = 1
    @prev_num    = 0
  end

  def fib(position)
    (position+1).times { @result = calculate }
    @result 
  end

  private
    def calculate
      def calculate
        def calculate
          (@prev_num, @current_num = @current_num, @prev_num + @current_num).last
        end
      end
    end
end
