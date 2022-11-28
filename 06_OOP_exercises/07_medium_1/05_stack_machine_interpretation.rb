=begin

https://launchschool.com/exercises/4b24c3b4

RB101 instructions:

A stack is a list of values that grows and shrinks dynamically. In ruby, a stack is easily implemented as an Array that just uses the #push and #pop methods.

A stack-and-register programming language is a language that uses a stack of values. Each operation in the language operates on a register, which can be thought of as the current value. The register is not part of the stack. Operations that require two values pop the topmost item from the stack (that is, the operation removes the most recently pushed value from the stack), perform the operation using the popped value and the register value, and then store the result back in the register.

Consider a MULT operation in a stack-and-register language. It multiplies the stack value with the register value, removes the value from the stack, and then stores the result back in the register. Thus, if we start with a stack of 3 6 4 (where 4 is the topmost item in the stack), and a register value of 7, then the MULT operation will transform things to 3 6 on the stack (the 4 is removed), and the result of the multiplication, 28, is left in the register. If we do another MULT at this point, then the stack is transformed to 3, and the register is left with the value 168.

	---------------------------------------------------------------------------------------
Stack Machine Interpretation

This is one of the hardest exercises in this exercise set. It uses both exceptions and Object#send, neither of which we've discussed in detail before now. Think of this exercise as one that pushes you to learn new things on your own, and don't worry if you can't solve it.

You may remember our Minilang language from back in the RB101-RB109 Medium exercises. We return to that language now, but this time we'll be using OOP. If you need a refresher, refer back to that exercise.

Write a class that implements a miniature stack-and-register-based programming language that has the following commands:

n Place a value n in the "register". Do not modify the stack.
PUSH Push the register value on to the stack. Leave the value in the register.
ADD Pops a value from the stack and adds it to the register value, storing the result in the register.
SUB Pops a value from the stack and subtracts it from the register value, storing the result in the register.
MULT Pops a value from the stack and multiplies it by the register value, storing the result in the register.
DIV Pops a value from the stack and divides it into the register value, storing the integer result in the register.
MOD Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
POP Remove the topmost item from the stack and place in register
PRINT Print the register value
All operations are integer operations (which is only important with DIV and MOD).

Programs will be supplied to your language method via a string passed in as an argument. Your program should produce an error if an unexpected item is present in the string, or if a required stack value is not on the stack when it should be (the stack is empty). In all error cases, no further processing should be performed on the program.

You should initialize the register to 0.

=end

class Minilang
	attr_reader :full_command 

	COMMANDS = %w[PUSH ADD SUB MULT DIV MOD POP PRINT]
	@@register = 0
	@@stack = []

	def initialize(full_command)
		@full_command = full_command
	end

	def eval
		full_command.split(' ').each do |input|
			if input.to_i.integer? && input.to_i != 0
				@@register = input.to_i
			else
				begin
					validate_token(input)
				rescue ArgumentError
					puts "Invalid token: #{input}"
					break
				end
				token = Command.new
				token.send(input.downcase.to_sym)
			end
		end
	end

	def validate_token(token)
		raise ArgumentError.new unless COMMANDS.include?(token)
	end
end

class Command < Minilang

	def initialize;	end

	def push
		@@stack.push(@@register)
	end

	def add
		@@register += @@stack.pop 
	end

	def sub
		@@register -= @@stack.pop
	end

	def mult
		@@register *= @@stack.pop
	end

	def div
		@@register /= @@stack.pop
	end

	def mod
		@@register %= @@stack.pop
	end

	def pop
		begin
			self.validate_stack
		rescue SystemStackError
			puts "Empty stack!"
			return
		end
		@@register = @@stack.pop
	end

	def validate_stack
		raise SystemStackError.new unless !@@stack.empty?
	end

	def print
		puts @@register
	end
end

Minilang.new('PRINT').eval # 0
Minilang.new('5 PUSH 3 MULT PRINT').eval # 15
Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval # 5 3 8
Minilang.new('5 PUSH 10 PRINT POP PRINT').eval # 10 5
Minilang.new('5 PUSH POP POP PRINT').eval # Empty stack!
Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval # 6
Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval # 12
Minilang.new('-3 PUSH 5 XSUB PRINT').eval # Invalid token: XSUB
Minilang.new('-3 PUSH 5 SUB PRINT').eval # 8
Minilang.new('6 PUSH').eval # (nothing printed; no PRINT commands)