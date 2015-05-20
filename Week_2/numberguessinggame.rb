random_number = rand(101)
i = 5
print "Guess a number between 1 and 100: "
user_guess = gets.chomp.to_i

while (1 == 1)
	if (user_guess == random_number)
		puts "Congratulations!!! You guessed the right number!"
		break
	else
		i = i - 1
		if (random_number < user_guess)
			puts "The number is lower than your guess"
		elsif (random_number > user_guess)
			puts "The number is higher than your guess"
		end
		puts "You have #{i} guesses left!"
	end
	if (i == 0)
		puts "You have no more chances left, sorry."
		puts "The correct number was #{random_number}."
		break
	else
		print "Guess again?: "
		user_guess = gets.chomp.to_i
	end
end


