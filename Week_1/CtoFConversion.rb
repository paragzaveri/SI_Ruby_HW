
def conversion(temp)
	temp = (temp*9/5) + 32
	puts "Your temperature is #{temp} in degrees Fahrenheit."
end

print "What is your temperature in Celsius?: "

celsius = gets.chomp.to_i


conversion(celsius)

