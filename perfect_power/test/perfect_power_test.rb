require 'minitest/autorun'
require './lib/perfect_power'

class PerfectPowerTest < Minitest::Test
  def setup
    @perfect_power = PerfectPower.new
  end

  def test_be_valid_for_lower_numbers
    assert_equal [2,2], @perfect_power.isPP(4)
    assert_equal [6,2], @perfect_power.isPP(36)
    assert_equal [3,2], @perfect_power.isPP(9) 
    assert_equal nil, @perfect_power.isPP(5)
  end

  def test_work_with_random_values
    1.upto(100) do |x|
      a = rand(1000..65000)
      r = @perfect_power.isPP(a)
      if !r.nil? && (r[0] ** r[1]) != a
        assert_equal r, a
        break
      end
    end
  end

  def test_validate_perfect_power_of_27
    assert_equal [3, 3], @perfect_power.isPP(27)
  end

  def test_be_valid_for_lower_numbers_v2
    assert_equal [2,2], @perfect_power.isPPv2(4)
    assert_equal [6,2], @perfect_power.isPPv2(36)
    assert_equal [3,2], @perfect_power.isPPv2(9) 
    assert_equal nil, @perfect_power.isPPv2(5)
  end

  def test_v2_should_work_with_random_values
    1.upto(100) do |x|
      a = rand(1000..65000)
      r = @perfect_power.isPPv2(a)
      if !r.nil? && (r[0] ** r[1]) != a
        assert_equal r, a
        break
      end
    end
  end

  def test_be_valid_for_lower_numbers_v3
    assert_equal [2,2], @perfect_power.isPPv3(4)
    assert_equal [6,2], @perfect_power.isPPv3(36)
    assert_equal [3,2], @perfect_power.isPPv3(9) 
    assert_equal nil, @perfect_power.isPPv3(5)
  end

  def test_v3_should_work_with_random_values
    1.upto(100) do |x|
      a = rand(1000..65000)
      r = @perfect_power.isPPv3(a)
      if !r.nil? && (r[0] ** r[1]) != a
        assert_equal r, a
        break
      end
    end
  end

  def test_return_a_list_of_all_divisors
    assert_equal [1,2], @perfect_power.divisors(2)
  end

  def test_return_all_divisors_of_360
    assert_equal [1,2,3,4,5,6,8,9,10,12,15,18,20, 24,30,36,40,45,60,72,90,120,180,360].sort, @perfect_power.divisors(360)
  end

  def test_total_of_divisors_of_2
    assert_equal 2, @perfect_power.total_divisors(2)
  end

  def test_total_of_divisors_of_360
    assert_equal 24, @perfect_power.total_divisors(360)
  end
end
