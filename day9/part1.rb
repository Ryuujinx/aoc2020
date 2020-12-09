#!/usr/bin/env ruby

input = Array.new
File.readlines('input').each do |line|
  input << line.to_i
end

current_index = 25
input[25..-1].each do |var|
  match_found = false
  0.upto(current_index - 1) do |idx_a|
    (idx_a + 1).upto(current_index - 1) do |idx_b|
      if input[idx_a] + input[idx_b] == input[current_index]
        match_found = true
        break
      end
    end
    if match_found
      break
    end
  end
  unless match_found
    break
  end
  current_index += 1
end
      

puts "Output: #{input[current_index]}"