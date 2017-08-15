module ConnectFour
  RSpec.describe Game do
    let(:steve) { Player.new(name: 'steve', colour: 'red') }
    let(:rebecca) { Player.new(name: 'rebecca', colour: 'yellow') }

    describe "#initialize" do
      context "creating a new game" do
        it "randomly selects a new player" do
          allow_any_instance_of(Array).to receive(:shuffle).and_return([steve, rebecca])
          game = Game.new([steve, rebecca])
          expect(game.current_player).to eq steve
        end

        it "randomly selects an other player" do
          allow_any_instance_of(Array).to receive(:shuffle).and_return([steve, rebecca])
          game = Game.new([steve, rebecca])
          expect(game.other_player).to eq rebecca
        end
      end
    end

    describe "#switch_players" do
      context "switches players at the end of the turn" do
        it "changes the current_player to the other_player" do
          game = Game.new([steve, rebecca])
          other_player = game.other_player
          game.switch_players
          expect(game.current_player).to eq other_player
        end

        it "changes the other_player to the current_player" do
          game = Game.new([steve, rebecca])
          current_player = game.current_player
          game.switch_players
          expect(game.other_player).to eq current_player
        end
      end
    end

    describe "#solicit_move" do
      it "asks the current_player for input" do
	      game = Game.new([steve, rebecca])
	      allow(game).to receive(:current_player) {steve}
	      expected = "steve please make your move by entering a number between 1 and 7."
	      expect(game.solicit_move).to eq expected
	    end
	  end

    TestCell = Struct.new(:value)
		let(:red) { TestCell.new("RED") }
		let(:yellow) { TestCell.new("YELLOW") }
		let(:empty) { TestCell.new('') }

    describe "#get_move" do
      context "allows the player to enter input and maps to available space on board" do
        it "returns the coordinate of the correct array point" do
          horizontal_test_grid = [
						[empty, empty, empty, empty, empty, empty, empty],
						[empty, empty, empty, empty, empty, empty, empty],
						[empty, empty, empty, empty, empty, empty, empty],
						[red, empty, yellow, yellow, yellow, red, red],
						[red, yellow, yellow, red, yellow, red, red]
					]
          game = Game.new([steve, rebecca])
          allow(game.board).to receive(:grid) { horizontal_test_grid }
          expect(game.get_move(1)).to eq [0, 2]
        end
      end
    end
  end
end
