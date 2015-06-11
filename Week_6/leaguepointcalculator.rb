module Leaderboard
	def print_leaderboard_league(league,name)
		league = league.sort_by{|key,value| value}.reverse
		puts "\n\n\n#{name}"
		puts "\n\n"
		puts league
	end

	def print_leaderboard_interleague(league_1,league_2,name_1,name_2)
		league_1 = league_1.sort_by{|key,value| value}.reverse
		league_2 = league_2.sort_by{|key,value| value}.reverse
		puts "\n\n\n#{name_1}"
		puts "\n\n"
		puts league_1
		puts "\n\n\n#{name_2}"
		puts "\n\n"
		puts league_2
	end
end

module UpdateScores
	def calculate_league_points(first_team,second_team,first_team_score,second_team_score,league)
		if first_team_score > second_team_score
			puts "\nThe #{first_team} Win!"
			league["#{first_team}"] += 3
			league["#{second_team}"] += 0
		elsif second_team_score > first_team_score
			puts "\nThe #{second_team} Win!"
			league["#{second_team}"] += 3
			league["#{first_team}"] += 0
		else
			puts "\nIt's a tie!"
			league["#{first_team}"] += 1
			league["#{second_team}"] += 1
		end
	end

	def calculate_interleague_points(first_team,second_team,first_team_score,second_team_score,league_1,league_2)
		if first_team_score > second_team_score
			puts "\nThe #{first_team} Win!"
			league_1["#{first_team}"] += 3
			league_2["#{second_team}"] += 0
		elsif second_team_score > first_team_score
			puts "\nThe #{second_team} Win!"
			league_2["#{second_team}"] += 3
			league_1["#{first_team}"] += 0
		else
			puts "\nIt's a tie!"
			league_1["#{first_team}"] += 1
			league_2["#{second_team}"] += 1
		end
	end
end

module Games
	include Leaderboard
	include UpdateScores
	def generate_league_game(league,name)
		keys = league.keys
 		first_team = keys[rand(15)]
		second_team = keys[rand(15)]

		if first_team == second_team
			puts "\nSorry, there was a glitch."
			input_scores
		else
		end
		puts "\nThe game is between the #{first_team} and the #{second_team}."
		puts "\nHow many runs did each team score?"
		print "\n#{first_team}: "
		first_team_score = gets.chomp.to_i
		print "#{second_team}: "
		second_team_score = gets.chomp.to_i
		
		calculate_league_points(first_team,second_team,first_team_score,second_team_score,league)

		print_leaderboard_league(league,name)

	end

	def generate_interleague_game(league_1,league_2,name_1,name_2)
		keys_1 = league_1.keys
		keys_2 = league_2.keys
		first_team = keys_1[rand(15)]
		second_team = keys_2[rand(15)]

		puts "\nThe game is between the #{first_team} and the #{second_team}."
		puts "\nHow many runs did each team score?"
		
		print "\n#{first_team}: "
		first_team_score = gets.chomp.to_i
		print "#{second_team}: "
		second_team_score = gets.chomp.to_i
	
		calculate_interleague_points(first_team,second_team,first_team_score,second_team_score,league_1,league_2)

		print_leaderboard_interleague(league_1,league_2,name_1,name_2)
	end

	def enter_league_game(league,name,array)
		puts "\nTeams to choose from:"
		puts ""
		puts name
		puts ""
		puts array
		print "\n\nEnter first team name (case-sensitive): "
		first_team = gets.chomp
		if array.include?(first_team)
			print "How many runs: "
			first_team_score = gets.chomp.to_i
			puts ""
		else
			puts "\n\nSorry not a valid team name, try again."
			enter_league_game(league,name,array)
		end
		print "\nEnter second team name (case-sensitive): "
		second_team = gets.chomp
		if array.include?(second_team)
			print "How many runs: "
			second_team_score = gets.chomp.to_i
			puts ""
		else
			puts "\n\nSorry not a valid team name, try again. (re-enter both teams)"
			enter_league_game(league,name,array)
		end

		calculate_league_points(first_team,second_team,first_team_score,second_team_score,league)

		print_leaderboard_league(league,name)
	end

	def enter_interleague_game(league_1,league_2,name_1,name_2,array_1,array_2)
		puts "\nTeams to choose from:"
		puts ""
		puts name_1
		puts ""
		puts array_1
		print "\n\nEnter first team name (case-sensitive): "
		first_team = gets.chomp
		if array_1.include?(first_team)
			print "How many runs: "
			first_team_score = gets.chomp.to_i
			puts ""
		else
			puts "\n\nSorry not a valid team name, try again."
			enter_interleague_game(league_1,league_2,name_1,name_2,array_1,array_2)
		end
		puts "\nFirst team entered. Enter second team."
		puts "\nTeams to choose from: "
		puts name_2
		puts ""
		puts array_2
		print "\nnter second team name (case_sensitive): "
		second_team = gets.chomp
		if array_2.include?(second_team)
			print "How many runs: "
			second_team_score = gets.chomp.to_i
			puts ""
		else
			puts "\n\nSorry not a valid team name, try again. (re-enter both teams)"
			enter_interleague_game(league_1,league_2,name_1,name_2,array_1,array_2)
		end
		calculate_interleague_points(first_team,second_team,first_team_score,second_team_score,league_1,league_2)
		print_leaderboard_interleague(league_1,league_2,name_1,name_2)
	end
end

class LPC
	include Games	
	include Leaderboard
	def initialize(name)
		@name = name
		puts "\nWelcome to the League Point Calculator #{@name}!"
		puts "\nHere is a list of all the teams in both leagues."
		@american_league_hash = {
			"Baltimore Orioles" => @orioles_points=0,
			"Boston Red Sox" => @redsox_points=0,
			"New York Yankees" => @yankees_points=0,
			"Tampa Bay Rays" => @rays_points=0,
			"Toronto Blue Jays" => @bluejays_points=0,
			"Chicago White Sox" => @whitesox_points=0,
			"Cleveland Indians" => @indians_points=0,
			"Detroit Tigers" => @tigers_points=0,
			"Kansas City Royals" => @royals_points=0,
			"Minnesota Twins" => @twins_points=0,
			"Houston Astros" => @astros_points=0,
			"Los Angeles Angels of Anaheim" => @angels_points=0,
			"Oakland Athletics" => @athletics_points=0,
			"Seattle Mariners" => @mariners_points=0,
			"Texas Rangers" => @rangers_points=0
		}
		@national_league_hash = {
			"Atlanta Braves" => @braves_points=0,
			"Miami Marlins" => @marlins_points=0,
			"New York Mets" => @mets_points=0,
			"Philadelphia Phillies" => @phillies_points=0,
			"Washington Nationals" => @nationals_points=0,
			"Chicago Cubs" => @cubs_points=0,
			"Cincinnati Reds" => @reds_points=0,
			"Milwaukee Brewers" => @brewers_points=0,
			"Pittsburgh Pirates" => @pirates_points=0,
			"St. Louis Cardinals" => @cardinals_points=0,
			"Arizona Diamondbacks" => @diamondbacks_points=0,
			"Colorado Rockies" => @rockies_points=0,
			"Los Angeles Dodgers" => @dodgers_points=0,
			"San Diego Padres" => @padres_points=0,
			"San Francisco Giants" => @giants_points=0
		}
		@american_league_array = ["Baltimore Orioles", "Boston Red Sox", "New York Yankees", "Tampa Bay Rays", "Toronto Blue Jays", "Chicago White Sox", "Cleveland Indians", "Detroit Tigers","Kansas City Royals","Minnesota Twins", "Houston Astros", "Los Angeles Angels of Anaheim","Oakland Athletics","Seattle Mariners","Texas Rangers"]
		@national_league_array = ["Atlanta Braves","Miami Marlins","New York Mets","Philadelphia Phillies","Washington Nationals","Chicago Cubs","Cincinnati Reds","Milwaukee Brewers","Pittsburgh Pirates","St. Louis Cardinals","Arizona Diamondbacks","Colorado Rockies","Los Angeles Dodgers","San Diego Padres","San Francisco Giants"]
		puts "\nAmerican League"
		puts "\n"
		puts @american_league_array
		puts "\nNational League"
		puts "\n"
		puts @national_league_array
		@american_league_name = "American League"
		@national_league_name = "National League"
		input_scores
	end

	def input_scores()
		print "\n\n\nWould you like to input scores? ([0]:League Play, [1]:Interleague Play, [2]:Exit): " 
		user_input = gets.chomp.to_i
		if (user_input == 0)
			league_play
		elsif (user_input == 1)
			interleague_play
		else
			exit()
		end
	end

	def league_play()
		print "([0]: American League, [1]: National League): "
		user_input = gets.chomp.to_i
		if (user_input == 0)
			american_league
		else
			national_league
		end	
	end

	def american_league()
		print "\n([0]: Generate League Game, [1]: Enter League Game): "
		user_input = gets.chomp.to_i
		if user_input == 0
			generate_league_game(@american_league_hash,@american_league_name)
		else
			enter_league_game(@american_league_hash,@american_league_name,@american_league_array)
		end
		input_scores
	end

	def national_league()
		print "\n([0]: Generate League Game, [1]: Enter League Game): "
		user_input = gets.chomp.to_i
		if user_input == 0
			generate_league_game(@national_league_hash,@national_league_name)
		else
			enter_league_game(@national_league_hash,@national_league_name,@national_league_array)
		end
		input_scores

	end

	def interleague_play()
		print "\n([0]: Generate Interleague Game, [1]: Enter Interleague Game): "
		user_input = gets.chomp.to_i
		if user_input == 0
			generate_interleague_game(@american_league_hash,@national_league_hash,@american_league_name,@national_league_name)
		else
			enter_interleague_game(@american_league_hash,@national_league_hash,@american_league_name,@national_league_name,@american_league_array,@national_league_array)
		end
		input_scores
	end

	def exit()
		puts "\n\n\nFinal League Scores:"
		print_leaderboard_interleague(@american_league_hash,@national_league_hash,@american_league_name,@national_league_name)

		puts "\n\nHope you had a good time!  Goodbye!"
	end
end


new_league = LPC.new("Parag")	