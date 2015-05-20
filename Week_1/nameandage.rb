print "What is your first name? "
first_name = gets.chomp
print "What is your last name? "
last_name = gets.chomp
print "How old are you? "
age = gets.chomp.to_i
age = (2015 - age)

puts "#{first_name} #{last_name} was born in #{age}."