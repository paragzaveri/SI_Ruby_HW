to_grandma = gets.chomp


until (to_grandma == "BYE")
	if (to_grandma == to_grandma.upcase)
		random_year = 30 + Random.rand(51)
		puts "NO,NOT SINCE 19#{random_year}!"
	else
		puts "HUH?!, SPEAK UP SONNY!"
	end
	to_grandma = gets.chomp
end
