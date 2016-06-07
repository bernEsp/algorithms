require 'benchmark'
require './lib/fibonacci'
require './lib/fibonacci_dynamic'

@fibonacci = Fibonacci.new
@fibonaccid = FibonacciDynamic.new
Benchmark.bmbm do |x|
  x.report('recursive 10th') { @fibonacci.fib(10) }
  x.report('recursive 20th') { @fibonacci.fib(20) }
  x.report('recursive 100th') { @fibonacci.fib(100) }
  x.report('dynamic 10th') { @fibonaccid.fib(10) }
  x.report('dynamic 20th') { @fibonaccid.fib(20) }
  x.report('dynamic 100th') { @fibonaccid.fib(100) }
end

