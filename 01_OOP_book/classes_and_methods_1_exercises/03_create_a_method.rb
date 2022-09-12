=begin

You want to create a nice interface that allows you to accurately describe the action you want your program to perform. Create a method called spray_paint that can be called on an object and will modify the color of the car.

=end

class MyCar
	attr_accessor :color
	attr_reader :year

	def initialize(year, color, model)
		@year = year
		@color = color
		@model = model
		@current_speed = 0
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
end

my_car = MyCar.new('1999', 'beige', 'ford_fiesta')

def spray_paint(car_object, color)
	car_object.change_color(color)
end	

spray_paint(my_car, 'blue')

=begin

They meant a class method:

class MyCar
  attr_accessor :color
  attr_reader :year

  # ... rest of class left out for brevity

  def spray_paint(color)
    self.color = color
    puts "Your new #{color} paint job looks great!"
  end
end

lumina.spray_paint('red')   #=> "Your new red paint job looks great!"

=end