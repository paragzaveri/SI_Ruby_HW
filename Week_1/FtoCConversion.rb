
def conversion(temp)
	temp = (temp - 32) *5/9
	puts "Your temperature is #{temp} in degrees Celsius."
end

print "What is your temperature in Fahrenheit?: "

fahrenheit = gets.chomp.to_i


conversion(fahrenheit)