#!/usr/bin/env ruby

bags = Hash.new
input = Array.new
File.readlines('input').each do |line|
  input << line.strip
end


def search(hsh, bags=nil, subsearch=false)
  unless @bags
    @bags = bags
  end
  unless @subsearch
    @subsearch = subsearch
  end
  unless @bag_count
    @bag_count = 0
  end
  hsh.each_pair do |k,v|
    if ! subsearch
      @multi = v
    end
    if v.is_a?(Integer)
      temp_multi = @multi
      if subsearch
        @bag_count += v * @multi
        @multi = v * @multi
      else
        @bag_count += v
      end
      if @bags[k]
        foo = search(@bags[k], nil, true)
        @multi = temp_multi
      end
    end
  end
  return @bag_count
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

puts "Output: #{search(bags["shiny gold"], bags)}"