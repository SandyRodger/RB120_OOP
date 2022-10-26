def letter_case_count(str)
	{}
	counts[:lowercase] = str.count { |char| char =~ /[a-z]/}
	counts[:uppercase] = str.count { |char| char =~ /[A-Z]/}
	counts[:neither] = str.count { |char| char =~ /[^A-Za-z]/}

end

p letter_case_count("Moonmen???")