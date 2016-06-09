class EnumFeeder
  def each
    yield(1)
    yield(2)
    yield(3)
  end

  def map
    while true
      v = []
      begin 
        v << self.each.next
      rescue StopIteration
        return $!.result
      end 
      @enum_feeder.feed @v
    end
  end
end
