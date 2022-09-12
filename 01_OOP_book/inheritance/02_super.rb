class Nature
	def grow
		"weeeeeee, I'm growing"
	end
end

class Tree < Nature
	def grow
		super + " a load of branches"
	end
end

elm = Tree.new
p elm.grow