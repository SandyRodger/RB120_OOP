def sum_rats(arr)
	arr.map do |n, d|
		Rational(n, d)
	end.sum
end

arr = [[1,2], [3, 4], [4, 7]]
p sum_rats(arr)