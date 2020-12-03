#!/usr/bin/env ruby


input = Array.new
File.readlines('input').each do |line|
  input << line.strip
end

x_pos = 0
tree_count = 0

input.each do |row|
  if row[x_pos] == "#"
    tree_count += 1
  end
  x_pos += 3
  if row[x_pos].nil?
    x_pos = x_pos % row.length
  end
end

puts "Output: #{tree_count}"
