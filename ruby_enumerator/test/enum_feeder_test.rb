require 'minitest/autorun'
require './lib/enum_feeder'

class EnumFeederTest <  Minitest::Test
  def setup
    @enum_feeder = EnumFeeder.new.to_enum
    @r = nil
    @v = []
  end

  def test_feed_map_values
    while true
      begin 
        @v << @enum_feeder.next
      rescue StopIteration
        return assert_equal [1,2,3], $!.result 
      end 
      @enum_feeder.feed @v
    end
  end

  def test_feed_map_values_take_2_values
    assert_equal [1,2], @enum_feeder.map.take(2)
  end

end
