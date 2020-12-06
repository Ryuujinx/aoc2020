#!/usr/bin/env ruby

group = Array.new
answer = String.new
output = 0
File.readlines('input').each do |line|
  if line.strip.empty?
    group << answer
    answer = String.new
    next
  end
  line.strip.chars.each do |char|
    unless answer.include?(char)
      answer += char
    end
  end
end

unless answer.empty?
  group << answer
  answer = String.new
end

group.each do |responses|
  output += responses.length
end

puts "Output: #{output}"