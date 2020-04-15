#!/usr/bin/env ruby

puts (1...1000)
    .filter { |n| n % 3 == 0 or
                  n % 5 == 0 }
    .sum
