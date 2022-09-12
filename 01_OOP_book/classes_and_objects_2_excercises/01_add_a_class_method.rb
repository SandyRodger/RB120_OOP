=begin

Add a class method to your MyCar class that calculates the gas mileage of any car

=end
THIS_YEAR = 2022

class MyCar
	attr_accessor :color
	attr_reader :year

	def initialize(year, color, model)
		@year = year
		@color = color
		@model = model
		@current_speed = 0
	end

	def self.gas_mileage(miles_driven, gallons_input)
		total = miles_driven/gallons_input
		p "this car has consumed #{total} gallons per mile"
	end

	def change_color(new_color)
		color = new_color
		puts "you changed the color to #{color}"
	end

	def view_year
		puts "this car was made in #{year}"
	end

	def current_speed
		p "you are now going #{@current_speed} mph"
	end

	def brake(num)
		@current_speed -= num
		p "you brake by #{num} mph"
	end

	def shut_off
		@current_speed = 0
		p "shut down"
	end

	def speed_up(num)
		@current_speed += num
		p "you accelerated by #{num}"
	end

	def spray_paint(color)
    self.color = color
    puts "Your new #{color} paint job looks great!"
  end

end

my_car = MyCar.new('1999', 'beige', 'ford_fiesta')
MyCar.gas_mileage(200, 20)