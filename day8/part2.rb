#!/usr/bin/env ruby

computer = Array.new
File.readlines('input').each do |line|
  computer << line.split
end


def execute_nop(pointer, arg, acc, computer)
  unless computer[pointer][2].nil?
    puts "Duplicate Found executing nop, exiting."
    puts "Current acc: #{acc}"
    return pointer, acc, computer, "failed"
  end
  computer[pointer][2] = "set"
  pointer += 1
  return pointer, acc, computer, "success"
end

def execute_jmp(pointer, arg, acc, computer)
  unless computer[pointer][2].nil?
    puts "Duplicate Found executing jmp, exiting."
    puts "Current acc: #{acc}"
    return pointer, acc, computer, "failed"
  end
  computer[pointer][2] = "set"
  pointer += arg.to_i
  return pointer, acc, computer, "success"
end

def execute_acc(pointer, arg, acc, computer)
  unless computer[pointer][2].nil?
    puts "Duplicate Found executing acc, exiting."
    puts "Current acc: #{acc}"
    return pointer, acc, computer, "failed"
  end
  computer[pointer][2] = "set"
  acc += arg.to_i
  pointer += 1
  return pointer, acc, computer, "success"
end

def run_computer(pointer, computer, acc)
  status = "success"
  while  computer[pointer] && status == "success"
    case computer[pointer][0].strip
    when "nop"
      pointer,acc,computer,status = execute_nop(pointer,computer[pointer][1],acc,computer)
    when "jmp"
      pointer,acc,computer,status = execute_jmp(pointer,computer[pointer][1],acc,computer)
    when "acc"
      pointer,acc,computer,status = execute_acc(pointer,computer[pointer][1],acc,computer)
    end
  end
  return acc, status
end




status = "failed"
old_instruction = "foo"
old_instruction_pointer = 0
tested_pointers = []
while status == "failed"
  acc = 0
  pointer = 0
  computer.each do |instruction|
    if instruction[0] == "jmp" && ! tested_pointers.include?(old_instruction_pointer)
      computer[old_instruction_pointer][0] = "nop"
      old_instruction = "jmp"
      tested_pointers << old_instruction_pointer
      break
    elsif instruction[0] == "nop" && ! tested_pointers.include?(old_instruction_pointer)
      computer[old_instruction_pointer][0] = "jmp"
      old_instruction = "nop"
      tested_pointers << old_instruction_pointer
      break
    else
      old_instruction_pointer += 1
    end
  end
  acc, status = run_computer(pointer,computer, acc)
  if status == "failed"
    acc = 0
    pointer = 0
    computer[old_instruction_pointer][0] = old_instruction
    old_instruction_pointer = 0
    computer.each do |instruction|
      if instruction[-1] == "set"
        instruction.pop
      end
    end
  end
end


puts "Program successfully terminated, exiting."
puts "Current acc: #{acc}"
