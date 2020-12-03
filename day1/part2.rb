#!/usr/bin/env ruby

input = Array.new
File.readlines('input').each do |line|
  input << line.to_i
end

index_a = 1
index_b = 2
input.each do |num1|
  input[index_a..-1].each do |num2|
    input[index_b..-1].each do |num3|
      if num1 + num2 + num3 == 2020
        puts "Output: #{num1 * num2 * num3}"
        exit
      end
    end
    index_b += 1
  end
  index_a += 1
  index_b = index_a + 1
end