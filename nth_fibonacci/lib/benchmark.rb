require 'benchmark'
require './lib/fibonacci'
require './lib/fibonacci_dynamic'
require './lib/fibonacci_iterator'

@fibonacci = Fibonacci.new
@fib_iterator = FibonacciIterator.new
Benchmark.bmbm do |x|
  x.report('dynamic') { (100 .. 1000).each { |n| instance_variable_set("@fib#{n}", FibonacciDynamic.new); f = instance_variable_get("@fib#{n}"); f.fib(n) } }
  x.report('recursive') { (100 .. 1000).each { |n| instance_variable_set("@fib2#{n}", Fibonacci.new); f = instance_variable_get("@fib2#{n}"); f.fib(n) } }
  x.report('recursive_direct') { (100 .. 1000).each { |n| @fibonacci.fib(n) } }
  x.report('iterator_direct') { (100 .. 1000).each { |n| @fib_iterator.fib(n) } }
end
