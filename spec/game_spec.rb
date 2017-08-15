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
  end
end
