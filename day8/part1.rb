#!/usr/bin/env ruby

computer = Array.new
File.readlines('input').each do |line|
  computer << line.split
end


def execute_nop(pointer, arg, acc, computer)
  unless computer[pointer][2].nil?
    puts "Duplicate Found executing nop, exiting."
    puts "Current acc: #{acc}"
    exit
  end
  #puts "Executing nop, setting #{pointer}"
  computer[pointer][2] = "set"
  pointer += 1
  return pointer, acc, computer
end

def execute_jmp(pointer, arg, acc, computer)
  unless computer[pointer][2].nil?
    puts "Duplicate Found executing jmp, exiting."
    puts "Current acc: #{acc}"
    exit
  end
  #puts "Executing jmp, setting #{pointer}"
  computer[pointer][2] = "set"
  pointer += arg.to_i
  return pointer, acc, computer
end

def execute_acc(pointer, arg, acc, computer)
  unless computer[pointer][2].nil?
    puts "Duplicate Found executing acc, exiting."
    puts "Current acc: #{acc}"
    exit
  end
  #puts "Executing acc, setting #{pointer}"
  computer[pointer][2] = "set"
  acc += arg.to_i
  pointer += 1
  return pointer, acc, computer
end


pointer = 0
acc = 0
while true
  case computer[pointer][0]
  when "nop"
    pointer,acc,computer = execute_nop(pointer,computer[pointer][1],acc,computer)
    #puts pointer
  when "jmp"
    pointer,acc,computer = execute_jmp(pointer,computer[pointer][1],acc,computer)
    #puts pointer
  when "acc"
    pointer,acc,computer = execute_acc(pointer,computer[pointer][1],acc,computer)
    #puts pointer
  end
end