#!/usr/bin/env ruby

input = Array.new
File.readlines('input').each do |line|
  input << line.to_i
end

index = 1
input.each do |num1|
  input[index..-1].each do |num2|
    if num1 + num2 == 2020
      puts "Output: #{num1 * num2}"
      exit
    end
  end
  index += 1
end