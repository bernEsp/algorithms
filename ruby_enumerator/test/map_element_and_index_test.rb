require 'minitest/autorun'
require 'map_element_index'

class MapElementIndexTest < Minitest::Test
  def setup
    @map_element_index = MapElementIndex.new
  end

  def test_array_elements_contains_index_and_elements
    assert_equal ['0:foo', '1:bar', '2:sas'], @map_element_index.perform
  end
end
