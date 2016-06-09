require 'minitest/autorun'
require 'internal_iterator'

class InternalIteratorsTest < Minitest::Test
  def setup
    @internal_iterator = InternalIterator.new
    @expected = [[[], [:b]], [[1], [:b, 1]], [[1, 2], [:b, 1, 2]], 3]
  end

  def test_internal_iterator_object
    assert_equal @expected, @internal_iterator.each {|*x| [x, [:b, *x] ] }
  end

  def test_internal_iterator_object_chain
    assert_equal @expected, @internal_iterator.ext_each(@internal_iterator.to_enum) {|*x| [x, [:b, *x] ]}
  end
end
