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
    if passport["byr"].to_i >= 1920 && passport["byr"].to_i <= 2002
      if passport["iyr"].to_i >= 2010 && passport["iyr"].to_i <= 2020
        if passport["eyr"].to_i >= 2020 && passport["eyr"].to_i <= 2030         
          if passport["hcl"] =~ /^#[a-f0-9]{6}$/
            if passport["ecl"] =~ /^amb$|^blu$|^brn$|^gry$|^grn$|^hzl$|^oth$/
              if passport["pid"] =~ /^\d{9}$/
                if passport["hgt"] =~ /cm/
                  if passport["hgt"].to_i >= 150 && passport["hgt"].to_i <= 193
                    output += 1
                  end
                elsif passport["hgt"] =~ /in/
                  if passport["hgt"].to_i >= 59 && passport["hgt"].to_i <= 76
                    output += 1
                  end
                end
              end
            end
          end
        end
      end
    end     
  end
end 

puts "Output: #{output}"