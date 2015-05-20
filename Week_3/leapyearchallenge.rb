print "Starting Year: "
starting_year = gets.chomp.to_i
print "Ending Year: "
ending_year = gets.chomp.to_i

(starting_year..ending_year).each do |year|
	if (!((year % 100) == 0)) && ((year % 4) == 0)
		puts year
	end
	if ((year % 400) == 0)
		puts year
	end
end

