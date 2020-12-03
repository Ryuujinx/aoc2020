#!/usr/bin/env ruby

input = Array.new
File.readlines('input').each do |line|
  input << line.split
end

valid_count = 0
input.each do |psw|
  min_count,max_count = psw[0].split('-')[0,2]
  char = psw[1].gsub(':','')
  if min_count.to_i <= psw[2].count(char) && max_count.to_i >= psw[2].count(char)
    valid_count += 1
  end
end

puts "Output: #{valid_count}"