=begin

What is the structure defined on lines 1-12? Add the necessary code so that lines 16-21 output the appropriate values. What is it that you have included in the code snippet that allows this code to function properly? Describe in detail the relationship between the structure defined on lines 1-12 and the code you've added. What does that relationship have to do with what's output by lines 16-21?

=end

class School
  attr_reader :name, :mascot

  def initialize(name, mascot)
    @name = name
    @mascot = mascot
  end

  def summer_break
    "School's out for summer!"
  end
end

# code missing here

p stingrays.name # "Eastern HS"
p pioneers.name # "Western HS"
p stingrays.mascot # "Stingray"
p pioneers.mascot # "Pioneer"
p stingrays.summer_break # "School's out for summer!"
p pioneers.summer_break # "School's out for summer!"

=begin

Your Answer

Lines 1 - 12 are a class called School. The code missing in line 14 is as follows:

'''ruby stingrays = School.new("Eastern HS", "Stingray") pioneers = School.new("Western HS", "Pioneer") ''' Here I have initialized two School objects and saved them as local variables stingrays and pioneers . This allows the instance methods in lines 16 to 21 to be called on the objects. The School#mascot method and School#name method are getter methods which return the value assigned to their instance variables. These getter methods are defined in line 2, which is syntactical sugar for the following getter method:

=end
def name
   @name
end

=begin
, which returns the @name instance variable. The #summer_break method implements identically for both objects, returning a string.

Responses

Clare MacAdie (TA)
about 5 hours ago
Be careful to format code blocks with back ticks rather than apostrophes, and use inline code formatting for methods such as School#mascot 😉.

This is a good answer, but you haven't provided sufficient detail regarding 'the relationship between the structure defined on lines 1-12 and the code you've added'. Specifically:

Can you explain in more detail the relationship between a class and an instance of that class?
What are the similarities and differences between different instances of the same class?

Sandy Rodger
about an hour ago
Instances of a class are objects which have access to all of the behaviours defined in their class and store individual information in instance variables. In my answer the stingrays object and the pioneers objects are both instances of the School class and so have access to the following methods: School#name, School#summer_break and School#initialize, which is called with School#new. Differences between instances of a class are stored in instance variables, which here are @name and @mascot. So both School objects contain different objects in their instance variables.
=end