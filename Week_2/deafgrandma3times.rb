to_grandma = gets.chomp
i = 0

while (1 == 1)
	if (to_grandma == "BYE")
		i = i + 1
	elsif (to_grandma == to_grandma.upcase)
		random_year = 30 + Random.rand(51)
		puts "NO,NOT SINCE 19#{random_year}!"
		i = 0
	else
		puts "HUH?!, SPEAK UP SONNY!"
		i = 0
	end
	break if i == 3
	to_grandma = gets.chomp

end
