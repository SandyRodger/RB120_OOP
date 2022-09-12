=begin

https://launchschool.com/lessons/f1c58be0/assignments/652f8d69


Alan created the following code to keep track of items for a shopping cart application he's writing:

Alyssa looked at the code and spotted a mistake. "This will fail when update_quantity is called", she says.

Can you spot the mistake and how to address it?

=end

class InvoiceEntry
  attr_reader :quantity, :product_name
	attr_writer :quantity

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    self.quantity = updated_count if updated_count >= 0
  end
end

data = InvoiceEntry.new('baba', 1010)
data.update_quantity(2020)
p data.quantity
# The class lacks a setter method for quantity and a self prefix for qantity in line 25.

