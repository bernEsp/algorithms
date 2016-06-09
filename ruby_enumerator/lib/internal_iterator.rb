class InternalIterator
  def initialize
    @io_result = []
  end

  def each
    @io_result << yield # prints block evaluation
    @io_result << yield(1) # prints block evaluation passing one argument with value 1 
    @io_result << yield(1,2) # pass 2 arguments with values 1,2
    @io_result <<  3
  end

  def ext_each(enum)
    while true # loop while true is true 'infinity' until break
      begin
        enum_values = enum.next_values # this return an array of with next value
      rescue StopIteration
        return $!.result # get the feed collection of values
      end
      feed_value = yield(*enum_values) # pass to block the enum_values as array arguments. [ enum_values ]  
      enum.feed feed_value
    end
  end
end
