#!/usr/bin/env ruby

input = Array.new
passport = Hash.new
required_fields = ["byr","iyr","eyr","hgt","hcl","ecl","pid"]
optional_fields = ["cid"]
output = 0
File.readlines('input').each do |line|
  if line.strip.empty?
    input << passport
    passport = Hash.new
    next
  end
  passport = passport.merge(Hash[line.split.map { |a| a.split(':') }])
end

unless passport.empty?
  input << passport
  passport = Array.new
end

input.each do |passport|
  if (required_fields - passport.keys).empty?
    output += 1
  end
end 

puts "Output: #{output}"