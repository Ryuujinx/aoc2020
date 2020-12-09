#!/usr/bin/env ruby

input = Array.new
File.readlines('input').each do |line|
  input << line.to_i
end

magic_number = 373803594

current_index = 0
range = Array.new
storage = 0
input.each do |foo|
  range << foo
  storage = foo
  input[current_index +1..-1].each do |bar|
    range << bar
    storage += bar
    if storage == magic_number
      puts "Output: #{range.sort[0] + range.sort[-1]}"
    end
  end
  range = Array.new
  current_index += 1
end