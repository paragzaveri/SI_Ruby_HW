class Suspects
	def initialize()
		#Setting up and Printing out the Suspects
		@definition = ["Name","Gender","Skin Color","Hair Color","Eye Color"]
		@rachel = ["rachel","girl","black","auburn","brown"]
		@mac = ["mac","boy","white","black","brown"]
		@nick = ["nick","boy","white","brown","blue"]
		@angie = ["angie","girl","white","auburn","green"]
		@theo = ["theo","boy","white","blonde","brown"]
		@joshua = ["joshua","boy","white","black","brown"]
		@emily = ["emily","girl","white","blonde","blue"]
		@jason = ["jason","boy","white","blonde","green"]
		@john = ["john","boy","white","brown","blue"]
		@grace = ["grace","girl","black","black","brown"]
		@jake = ["jake","boy","white","brown","brown"]
		@megan = ["megan","girl","white","blonde","green"]
		@ryan = ["ryan","boy","white","auburn","brown"]
		@brandon = ["brandon","boy","white","blonde","brown"]
		@beth = ["beth","girl","white","blonde","brown"]
		@diane = ["diane","girl","black","brown","brown"]
		@chris = ["chris","boy","white","black","green"]
		@david = ["david","boy","black","black","brown"]
		@michelle = ["michelle","girl","black","brown","brown"]
		@tyson = ["tyson","boy","black","black","brown"]
		@ursula = ["ursula","girl","white","auburn","green"]
		puts "\nHere are your Suspects: "
		puts ""
		puts @definition.inspect
		puts ""
		puts @rachel.inspect
		puts @mac.inspect
		puts @nick.inspect
		puts @angie.inspect
		puts @theo.inspect
		puts @joshua.inspect
		puts @emily.inspect
		puts @jason.inspect
		puts @john.inspect
		puts @grace.inspect
		puts @jake.inspect
		puts @megan.inspect
		puts @ryan.inspect
		puts @brandon.inspect
		puts @beth.inspect
		puts @diane.inspect
		puts @chris.inspect
		puts @david.inspect
		puts @michelle.inspect
		puts @tyson.inspect
		puts @ursula.inspect
		###############################################################
		#Picking one of the suspects to be chosen as the guilty party
		random_number = rand(21)
		@array = [@rachel,@mac,@nick,@angie,@theo,@joshua,@emily,@jason,@john,@grace,@jake,@megan,@ryan,@brandon,@beth,@diane,@chris,@david,@michelle,@tyson,@ursula]
		@chosen_player = @array[random_number]

		# 0 = name, 1 = gender, 2 = skin_color, 3 = hair_color, 4 = eye_color
		#Setting up the attributes to be compared to
		@chosen_player_name = @chosen_player[0]
		@chosen_player_gender = @chosen_player[1]
		@chosen_player_skin_color = @chosen_player[2]
		@chosen_player_hair_color = @chosen_player[3]
		@chosen_player_eye_color = @chosen_player[4]
		#Established counter for number of guesses
		@guess_counter = 0

		#Want to play the game?
		print "\nA guilty party has been chosen, would you like to start guessing? (Y/N): "
		user_play_choice = gets.chomp.upcase
		if user_play_choice == "Y"
			guess
		else
			puts "\nGoodbye!"
		end
	end

	def guess()
		#Method for Guesses (will be called frequently)
		#Gives 10 guesses for now (should be 3)
		@guess_counter += 1
		if @guess_counter <= 10

			#options to guess from
			puts "\nChoose a number (0-4) for the following options:"
			puts "\n0 - Name"
			puts "1 - Gender"
			puts "2 - Skin Color"
			puts "3 - Hair Color"
			puts "4 - Eye Color\n"
	
			#user input for option to guess from
			print "\nChoice: "
			user_guess_choice = gets.chomp.to_i

			#switch statement for choosing which method to call
			case
			when user_guess_choice == 0
				name
			when user_guess_choice == 1
				gender
			when user_guess_choice == 2
				skin_color
			when user_guess_choice == 3
				hair_color
			when user_guess_choice == 4
				eye_color 
			end
		else 
			#if guesses are over 10, then exits the game
			out_of_guesses
		end
	end

	def name()
		#method for guessing the actual name of the guilty suspect
		print "\nWho do you think the guilty suspect is?:  "
		name_choice = gets.chomp.upcase

		#if name is correctly chosen
		if @chosen_player_name.upcase == name_choice
			puts "\nYes the guilty suspect is #{name_choice}!"		
			@array.each do |item|
				#removes all other indices in array
				if item[0] != name_choice
					@array.delete(item)
				else
				end
			end
			
		#if not the correct name	
		else
			puts "\nNo the guilty suspect is not #{name_choice}"
			@array.each do |item|
				#only removes the guessed name
				if item[0] == name_choice
					@array.delete(item)
				else
				end
			end
		end
		#if you chose correctly, will take you to the end(winner), otherwise prints remaining suspects	
		if @chosen_player_name.upcase == name_choice
			winner
		else
			puts "\nHere are your left over suspects"
			puts ""
			@array.each do |item|
				puts item.inspect
			end
			#sends you back for another try at guessing (if remaining)	
			guess
		end

	end
	
	def gender()
		#method for guessing which gender

		#takes guess for which gender
		print "\nWhich gender do you think the guilty suspect is? (0 for boy, 1 for girl): "
		gender_choice_option = gets.chomp.to_i
		
		#sets option to gender name
		if gender_choice_option == 0
			gender_choice = "boy"
		else 
			gender_choice = "girl"
		end

		#if you guess correctly, will remove all instances of the other gender from the array
		if @chosen_player_gender == gender_choice
			puts "\nYes the guilty suspect is a #{gender_choice}"		
			@array.each do |item|
				if item[1] != gender_choice
					@array.delete(item)
				else
				end
			end
		#since your guess was wrong, will remove all instances of your guess
		else
			puts "\nNo the guilty suspect is not a #{gender_choice}"
			@array.each do |item|
				if item[1] == gender_choice
					@array.delete(item)
				else
				end
			end
		end
		#prints remaining suspects after you sorted by gender
		puts "\nHere are your left over suspects"
		puts ""
		@array.each do |item|
			puts item.inspect
		end

		#if down to one suspect will send to the end of the game
		if @array.count == 1
			one_left
		#if more than one suspect will guess again
		else
			guess
		end

	end
	
	def skin_color()
		#method for guessing which skin color

		#user input for skin color guess
		print "\nWhat skin color do you think the guily suspect has? (0 for black, 1 for white): "
		skin_choice_option = gets.chomp.to_i

		#sets option to skin color name
		if skin_choice_option == 0
			skin_choice = "black"
		else
			skin_choice = "white"
		end

		#if guess is correct, removes all other options for skin color
		if @chosen_player_skin_color == skin_choice
			puts "\nYes the guilty suspect does have #{skin_choice} colored skin"		
			@array.each do |item|
				if item[2] != skin_choice
					@array.delete(item)
				else
				end
			end
		#if guess is incorrect, removes all instances of that guess
		else
			puts "\nNo the guilty suspect does not have #{skin_choice} colored skin"
			@array.each do |item|
				if item[2] == skin_choice
					@array.delete(item)
				else
				end
			end
		end
		#prints all suspects remaining
		puts "\nHere are your left over suspects"
		puts ""
		@array.each do |item|
			puts item.inspect
		end
		#if down to one suspect will send to the end of the game
		if @array.count == 1
			one_left
		#if more than one suspect will guess again
		else
			guess
		end
	end
	
	def hair_color()
		#method for guessing hair color

		#prompts user for input on hair color guess
		puts "hair_color"
		print "\nWhat hair color do you think the guily suspect has? (0 for auburn, 1 for black, 2 for brown, 3 for blonde): "
		hair_choice_option = gets.chomp.to_i

		#sets user choice to color
		if hair_choice_option == 0
			hair_choice = "auburn"
		elsif hair_choice_option == 1
			hair_choice = "black"
		elsif hair_choice_option == 2
			hair_choice = "brown"
		else
			hair_choice = "blonde"
		end
		
		#if guess is correct, removes all other options for hair color
		if @chosen_player_hair_color == hair_choice
			puts "\nYes the guilty suspect does have #{hair_choice} colored hair"		
			@array.each do |item|
				if item[3] != hair_choice
					@array.delete(item)
				else
				end
			end
		#if guess is incorrect, removes just the instances of that guess
		else
			puts "\nNo the guilty suspect does not have #{hair_choice} colored hair"
			@array.each do |item|
				if item[3] == hair_choice
					@array.delete(item)
				else
				end
			end
		end
		#prints remaining suspects after hair color guess
		puts "\nHere are your left over suspects"
		puts ""
		@array.each do |item|
			puts item.inspect
		end
		#if down to one suspect will send to the end of the game
		if @array.count == 1
			one_left
		#if more than one suspect will guess again
		else
			guess
		end
	end
	
	def eye_color()
		#method for guessing eye color

		#prompt for user input on guess
		puts "eye_color"
		print "\nWhat eye color do you think the guily suspect has? (0 for brown, 1 for blue, 2 for green): "
		eye_choice_option = gets.chomp.to_i

		#sets user input to color
		if eye_choice_option == 0
			eye_choice = "brown"
		elsif eye_choice_option == 1
			eye_choice = "blue"
		else 
			eye_choice = "green"
		end

		#if guess is correct, removes all other options for eye color
		if @chosen_player_eye_color == eye_choice
			puts "\nYes the guilty suspect does have #{eye_choice} colored eyes"		
			@array.each do |item|
				if item[4] != eye_choice
					@array.delete(item)
				else
				end
			end
		#if guess is incorrect, removes only the instances of the guess
		else
			puts "\nNo the guilty suspect does not have #{eye_choice} colored eyes"
			@array.each do |item|
				if item[4] == eye_choice
					@array.delete(item)
				else
				end
			end
		end
		#prints remaining suspects
		puts "\nHere are your left over suspects"
		puts ""
		@array.each do |item|
			puts item.inspect
		end

		#if down to one suspect will send to the end of the game
		if @array.count == 1
			one_left
		#if more than one suspect will guess again
		else
			guess
		end
	end

	def out_of_guesses()
		#method for when the user runs out of guesses

		puts "\n\n\nSorry you ran out of guesses :( You lose."
		exit
	end

	def winner()
		#method for if the user wins the game

		puts "\nYou Win!!!"
		puts "\nCongratulations on your victory!"
		exit
	end

	def one_left()
		#method for if the user eliminates all but one suspect, without guessing a name

		puts "\nYou are down to only one suspect.  You found the guilty suspect!!!"
		winner
	end

	def exit()
		#last line of the game all methods should end here

		puts "\nHope you had fun! Goodbye."
	end	
end

new_game = Suspects.new
