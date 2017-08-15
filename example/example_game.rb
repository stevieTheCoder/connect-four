require_relative "../lib/connect_four.rb"

	puts "welcome to Connect4"
	puts "Please enter the name of the first player."
	player_1  = gets.chomp

	puts "#{player_1} please choose red(r) or yellow(y) using the keypad."
	player_1_choice = gets.chomp.downcase

	if player_1_choice == 'r'
    choice1 = 'red'
		choice2 = 'yellow'
	else
		choice1 = 'red'
	end

	puts "please enter the name of the second player"
	player_2 = gets.chomp

	puts "Ok #{player_1} and #{player_2}, lets play Connect4"

	player_1 = ConnectFour::Player.new({name: player_1, colour: choice1})
	player_2 = ConnectFour::Player.new({name: player_2, colour: choice2})

	players = [player_1, player_2]

	ConnectFour::Game.new(players).play
