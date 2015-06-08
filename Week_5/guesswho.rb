class Suspects
	def initialize
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

		random_number = rand(21)
		@array = [@rachel,@mac,@nick,@angie,@theo,@joshua,@emily,@jason,@john,@grace,@jake,@megan,@ryan,@brandon,@beth,@diane,@chris,@david,@michelle,@tyson,@ursula]
		@chosen_player = @array[random_number]

		# 0 = name, 1 = gender, 2 = skin_color, 3 = hair_color, 4 = eye_color

		@chosen_player_name = @chosen_player[0]
		@chosen_player_gender = @chosen_player[1]
		@chosen_player_skin_color = @chosen_player[2]
		@chosen_player_hair_color = @chosen_player[3]
		@chosen_player_eye_color = @chosen_player[4]

		@guess_counter = 0

		print "\nA guilty party has been chosen, would you like to start guessing? (Y/N): "
		user_play_choice = gets.chomp.upcase
		if user_play_choice == "Y"
			guess
		else
			puts "\nGoodbye!"
		end
	end

	def guess()

		@guess_counter += 1

		if @guess_counter <= 10

			puts "\nChoose a number (0-4) for the following options:"
			puts "\n0 - Name"
			puts "1 - Gender"
			puts "2 - Skin Color"
			puts "3 - Hair Color"
			puts "4 - Eye Color\n"
	
			print "\nChoice: "
			user_guess_choice = gets.chomp.to_i

			
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
			exit
		end
	end

	def name()
		puts "name"
		print "\nWho do you think the guilty suspect is?:  "
		name_choice = gets.chomp.upcase

		
		if @chosen_player_name.upcase == name_choice
			puts "\nYes the guilty suspect is #{name_choice}!"		
			@array.each do |item|
				if item[0] != name_choice
					@array.delete(item)
				else
				end
			end
			
			
		else
			puts "\nNo the guilty suspect is not #{name_choice}"
			@array.each do |item|
				if item[0] == name_choice
					@array.delete(item)
				else
				end
			end
		end
		if @chosen_player_name.upcase == name_choice
			winner
		else
			puts "\nHere are your left over suspects"
			puts ""
			@array.each do |item|
				puts item.inspect
			end
			guess
		end

	end
	
	def gender()
		puts "gender"
		print "\nWhich gender do you think the guilty suspect is? (0 for boy, 1 for girl): "
		gender_choice_option = gets.chomp.to_i
		
		if gender_choice_option == 0
			gender_choice = "boy"
		else 
			gender_choice = "girl"
		end

		if @chosen_player_gender == gender_choice
			puts "\nYes the guilty suspect is a #{gender_choice}"		
			@array.each do |item|
				if item[1] != gender_choice
					@array.delete(item)
				else
				end
			end
		else
			puts "\nNo the guilty suspect is not a #{gender_choice}"
			@array.each do |item|
				if item[1] == gender_choice
					@array.delete(item)
				else
				end
			end
		end
		puts "\nHere are your left over suspects"
		puts ""
		@array.each do |item|
			puts item.inspect
		end
		one_left if @array.count == 1
		guess
	end
	
	def skin_color()
		puts "skin_color"
		print "\nWhat skin color do you think the guily suspect has? (0 for black, 1 for white): "
		skin_choice_option = gets.chomp.to_i

		if skin_choice_option == 0
			skin_choice = "black"
		else
			skin_choice = "white"
		end

		if @chosen_player_skin_color == skin_choice
			puts "\nYes the guilty suspect does have #{skin_choice} colored skin"		
			@array.each do |item|
				if item[2] != skin_choice
					@array.delete(item)
				else
				end
			end
		else
			puts "\nNo the guilty suspect does not have #{skin_choice} colored skin"
			@array.each do |item|
				if item[2] == skin_choice
					@array.delete(item)
				else
				end
			end
		end
		puts "\nHere are your left over suspects"
		puts ""
		@array.each do |item|
			puts item.inspect
		end
		one_left if @array.count == 1
		guess
	end
	
	def hair_color()
		puts "hair_color"
		print "\nWhat hair color do you think the guily suspect has? (0 for auburn, 1 for black, 2 for brown, 3 for blonde): "
		hair_choice_option = gets.chomp.to_i

		if hair_choice_option == 0
			hair_choice = "auburn"
		elsif hair_choice_option == 1
			hair_choice = "black"
		elsif hair_choice_option == 2
			hair_choice = "brown"
		else
			hair_choice = "blonde"
		end
		if @chosen_player_hair_color == hair_choice
			puts "\nYes the guilty suspect does have #{hair_choice} colored hair"		
			@array.each do |item|
				if item[3] != hair_choice
					@array.delete(item)
				else
				end
			end
		else
			puts "\nNo the guilty suspect does not have #{hair_choice} colored hair"
			@array.each do |item|
				if item[3] == hair_choice
					@array.delete(item)
				else
				end
			end
		end
		puts "\nHere are your left over suspects"
		puts ""
		@array.each do |item|
			puts item.inspect
		end
		one_left if @array.count == 1
		guess
	end
	
	def eye_color()
		puts "eye_color"
		print "\nWhat eye color do you think the guily suspect has? (0 for brown, 1 for blue, 2 for green): "
		eye_choice_option = gets.chomp.to_i

		if eye_choice_option == 0
			eye_choice = "brown"
		elsif eye_choice_option == 1
			eye_choice = "blue"
		else 
			eye_choice = "green"
		end

		if @chosen_player_eye_color == eye_choice
			puts "\nYes the guilty suspect does have #{eye_choice} colored eyes"		
			@array.each do |item|
				if item[4] != eye_choice
					@array.delete(item)
				else
				end
			end
		else
			puts "\nNo the guilty suspect does not have #{eye_choice} colored eyes"
			@array.each do |item|
				if item[4] == eye_choice
					@array.delete(item)
				else
				end
			end
		end
		puts "\nHere are your left over suspects"
		puts ""
		@array.each do |item|
			puts item.inspect
		end
		one_left if @array.count == 1
		guess
	end

	def out_of_guesses()
		puts "\n\n\nSorry you ran out of guesses :( You lose."
		exit
	end

	def winner()
		puts "\nYou Win!!!"
		puts "\nCongratulations on your victory!"
		exit
	end

	def one_left()
		puts "\nYou are down to only one suspect.  You found the guilty suspect!!!"
		winner
	end

	def exit()
		puts "\nHope you had fun! Goodbye."
	end	
end

new_game = Suspects.new
