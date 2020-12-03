#!/usr/bin/env ruby

input = Array.new
File.readlines('input').each do |line|
  input << line.split
end

valid_count = 0
input.each do |psw|
  index1,index2 = psw[0].split('-')[0,2]
  char = psw[1].gsub(':','')
  if (psw[2][index1.to_i - 1] == char) ^ (psw[2][index2.to_i - 1] == char)
    valid_count += 1
  end
end

puts "Output: #{valid_count}"