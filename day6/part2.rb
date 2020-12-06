#!/usr/bin/env ruby

group = Array.new
answer = "#"
output = 0
File.readlines('input').each do |line|
  if line.strip.empty?
    answer.gsub("#","")
    group << answer
    answer = "#"
    next
  end
  if answer == "#"
    answer = line.strip
    next
  end
  answer.chars.each do |char|
    unless line.include?(char)
      answer.gsub!(char,"")
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