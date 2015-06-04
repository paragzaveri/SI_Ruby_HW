class Blackjack

	def initialize(name)
		@name=name
		puts "\n\nWelcome to the Blackjack Game #{@name}!\n\n"
		print "Would you like to play (y/n): "
		play_input = gets.chomp.upcase
		if (play_input == 'Y')		
			player_cards
		else
			puts "\nGoodbye!"
		end
	end

	def player_cards
		player_card_1 = 1 + rand(10)
		player_card_2 = 1 + rand(10)
		@total_player_cards = player_card_1 + player_card_2
		puts "\n\nYour cards are #{player_card_1} and #{player_card_2}\n"
		puts "Which brings you to a total of #{@total_player_cards}\n\n"
		dealer_cards
		player_hit
	end

	def dealer_cards
		@dealer_card_1 = 1 + rand(10)
		@dealer_card_2 = 1 + rand(10)
		@total_dealer_cards = @dealer_card_1 + @dealer_card_2
		puts "The dealer's is showing a #{@dealer_card_1} (other card is hidden)"
	end

	def player_hit
		while (1==1)
			print "\nWould you like to hit? (y/n): "
			user_input = gets.chomp.upcase
		
			if (user_input == 'Y') && (@total_player_cards <= 21)
				new_player_card = 1 + rand(10)
				puts "You drew a #{new_player_card}"
				@total_player_cards += new_player_card
				puts "Your total is #{@total_player_cards}\n\n"
				if @total_player_cards > 21
					puts "Sorry you are over 21.  You lose!\n"
					break
				end
			else
				puts "Your final total is #{@total_player_cards}\n\n"
				break
			end
		end
		compare
	end
	
	def dealer_hit
		puts "Dealer Cards: The Dealer drew #{@dealer_card_1} and #{@dealer_card_2}"
		puts "That gives the dealer a total of #{@total_dealer_cards}\n\n"
		while(1==1)
			if @total_dealer_cards < 17
				puts "Dealer hits...\n\n"
				new_dealer_card = 1 + rand(10)
				puts "Dealer drew a #{new_dealer_card}\n"
				@total_dealer_cards += new_dealer_card
				puts "Total Dealer cards is #{@total_dealer_cards}\n\n"
				if @total_dealer_cards > 21
					puts "Dealer is over 21.  You win!\n"
					break
				end
			elsif @total_dealer_cards >= 17
				puts "Dealer stays... Total of dealer cards is #{@total_dealer_cards}\n"
				break
			end
		end

	end

	def compare
		if @total_player_cards > 21
			puts "\n\n\nGame Over"
		else
			dealer_hit
		end

		puts "\n\n\nYour total: #{@total_player_cards}"
		puts "Dealer total: #{@total_dealer_cards}\n\n"
		if (@total_player_cards <= 21) && (@total_dealer_cards <= 21)
			if @total_player_cards > @total_dealer_cards
				puts "\nYou Win!!!\n"
			elsif @total_player_cards < @total_dealer_cards
				puts "\nYou lose.  Dealer Wins!!!\n"
			elsif @total_player_cards == @total_dealer_cards
				puts "\nIt's a tie!!!\n"
			end
		end
	end

end

Parag = Blackjack.new("Parag")