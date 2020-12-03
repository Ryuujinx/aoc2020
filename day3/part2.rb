#!/usr/bin/env ruby


input = Array.new
File.readlines('input').each do |line|
  input << line.strip
end

x_pos = 0
tree_count = [0,0,0,0,0]
tree_idx = 0
x_mov = [1,3,5,7,1]
y_idx = 0
y_mov = [1,1,1,1,2]
skip_row = false

x_mov.each do |x_mov|
  input.each do |row|
    if skip_row
      skip_row = false
      next
    end
    if row[x_pos] == "#"
      tree_count[tree_idx] += 1
    end
    x_pos += x_mov
    if row[x_pos].nil?
      x_pos = x_pos % row.length
    end
    if y_mov[y_idx] > 1 && ! skip_row
      skip_row = true
    end
  end
  x_pos = 0
  y_idx += 1
  tree_idx += 1
end 

output = tree_count.inject(:*)
puts "Output: #{output}"
