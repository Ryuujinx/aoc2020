#!/usr/bin/env ruby

input = Array.new
File.readlines('input').each do |line|
  input << line.strip
end

row = (0..127).to_a
col = (0..7).to_a
output = 0

input.each do |seat|
  row_id = row.dup
  col_id = col.dup
  seat.chars.each do |id|
    if id == "F"
      row_id = row_id[0..row_id.length/2 -1]
    elsif id == "B"
      row_id = row_id[row_id.length/2..-1]
    elsif id == "L"
      col_id = col_id[0..col_id.length/2 -1]
    elsif id == "R"
      col_id = col_id[col_id.length/2..-1]
    end
  end
  if row_id[0].to_i * 8 + col_id[0].to_i > output
    output = row_id[0].to_i * 8 + col_id[0].to_i
  end
end

puts "Output: #{output}"