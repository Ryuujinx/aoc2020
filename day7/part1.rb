#!/usr/bin/env ruby

bags = Hash.new
input = Array.new
File.readlines('input').each do |line|
  input << line.strip
end


def search(hsh, search=false)
  sub_search = search
  unless @bags
    @bags = hsh
  end
  unless @valid_bag_count
    @valid_bag_count = 0
  end
  hsh.each_pair do |k,v|
    if ! sub_search && k == "shiny gold"
      next
    elsif v.is_a?(Hash)
      v.each_pair do |subk,subv|
        if subk == "shiny gold"
          @valid_bag_count += 1
          break
        elsif @bags[subk]
          foo = search(@bags[subk], true)
          if foo == "valid"
            @valid_bag_count += 1
            break
          end
        end
      end
    elsif v.is_a?(Integer)
      if k == "shiny gold"
        return "valid"
      elsif ! @bags[k].empty?
        foo = search(@bags[k], true)
        if foo == "valid"
          return "valid"
        end
      end
    end
  end
  return @valid_bag_count
end

input.each do |rule|
  initial_match = rule.match(/^(\w+\s\w+)\sbags\scontain\s(.*)\.$/)
  bags[initial_match[1]] = Hash.new
  match_data = initial_match[2].match(/(no other|\d+)\s(\w+\s\w+)?\s?bag(?:s)?(?:,\s)?(.*)/)
  sub_count = match_data[1].to_i
  sub_name = match_data[2]
  if sub_name then bags[initial_match[1]][sub_name] = sub_count end
  until match_data[3].empty?
    match_data = match_data[3].match(/(no other|\d+)\s(\w+\s\w+)?\s?bag(?:s)?(?:,\s)?(.*)/)
    sub_count = match_data[1].to_i
    sub_name = match_data[2]
    if sub_name then bags[initial_match[1]][sub_name] = sub_count end
  end
end


puts "Output: #{search(bags)}"