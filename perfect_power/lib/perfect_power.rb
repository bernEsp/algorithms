require 'prime'
class PerfectPower
  def isPP(n)
    divisors = _divisors(n)
    divisors = divisors.delete_if{|x| x== 1 || x == n}.compact
    pr = perfect_powers(divisors, n)
    perfect_power_response(pr)
  end

  def divisors(n)
    divisors ||= _divisors(n).sort
  end

  def isPPv2(n)
    # n ** 0.5 = n ^ 1/2 = Math.sqrt n
    # reduce the list of divisors until the sqrt of n
    # considering only the n ** 0.5 first divisors
    (2 .. (n ** 0.5)).each do |m|
      k = (Math.log(n) / Math.log(m)).round
      return [m,k] if (m ** k == n )
    end
    return nil
  end

  def isPPv3(n)
    2.upto(n ** 0.5) do |m|
      # get all k valid for log of n with base m
      # when k is a float without decimals or zero
      # m ** k == n condition will be true
      k = Math.log(n, m).round
      return [m,k] if (m ** k == n)
    end
    return nil
  end

  def total_divisors(n)
    _total_divisors(n)
  end

  private
  def perfect_powers(divisors, n)
    max_k = Math.log2(n)
    perfect_powers = []
    1.upto(max_k) do |k|
      result = divisors.select{|div| div ** k == n}
      unless result.empty?
        perfect_powers = [result.first, k]
        break
      end
    end
    perfect_powers
  end

  def perfect_power_response(perfect_powers)
    return perfect_powers unless perfect_powers.empty?
  end

  def factorization(n, primes)
    pos = 0
    result = []
    while n != 1 
      break if pos >= primes.size
      if n % primes[pos] == 0
        n = n / primes[pos]
        result << primes[pos]
      else
        pos += 1
      end
    end
    result
  end

  def _total_divisors(n)
    # to know all divisors, we should multiply all exponents increase 1
    # exponents 3 and 2
    # (3+1) * (2+1)
    primes = Prime.first 10
    factors = factorization(n, primes)
    factor_powers = factor_powers(factors)
    factor_powers.values.inject(1) {|sum, p| sum * (p + 1)}
  end

  def _divisors(n)
    primes = Prime.first 10
    factors = factorization(n, primes)
    factor_powers = factor_powers(factors)
    # {2=>4, 3=>2, 5=>1}
    small_factor = factor_powers.keys.first
    factor_power_values = factor_powers.each_pair.collect do |prime, power|
      factor_power_values(prime, power)
    end
    # [[1,2,4,8,16], [1,3,9], [5]]
    row_divisors = [factor_power_values[0]]
    factor_power_values[1..-1]&.each do |fpv|
      tmp_row_divisors = []
      row_divisors.each do |values|
        fpv.each do |v|
          next if v == 1
          tmp_row_divisors << values.collect { |vs| vs * v }
        end
      end
      row_divisors << tmp_row_divisors.flatten
    end
    row_divisors.flatten
  end

  def factor_powers(divisors)
    result = {}
    divisors.each do |div|
      result[div] = divisors.count(div)
    end
    result
  end

  def factor_power_values(prime, power)
    (0..power).collect{|p| prime ** p }
  end
end
