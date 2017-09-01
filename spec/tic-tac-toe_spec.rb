require "tic-tac-toe"

describe TicTacToe do
  context "in a new game" do
    before(:each) do
      @game = TicTacToe.new
    end
    context "filling the top row with Xs" do
      it "should result in player 1 winning" do
        @game.place_mark("X","a3")
        @game.place_mark("X","a2")
        @game.place_mark("X","a1")
        expect(@game.winner).to eql("X")
      end
    end
    context "filling the middle row with Xs" do
      it "should result in player 1 winning" do
        @game.place_mark("X","b3")
        @game.place_mark("X","b2")
        @game.place_mark("X","b1")
        expect(@game.winner).to eql("X")
      end
    end
    context "filling the bottom row with Xs" do
      it "should result in player 1 winning" do
        @game.place_mark("X","c3")
        @game.place_mark("X","c2")
        @game.place_mark("X","c1")
        expect(@game.winner).to eql("X")
      end
    end
    context "filling a diagonal from a1 to c3" do
      it "should result in player 1 winning" do
        @game.place_mark("X","a1")
        @game.place_mark("X","b2")
        @game.place_mark("X","c3")
        expect(@game.winner).to eql("X")
      end
    end
    context "filling a diagonal from c1 to a3" do
      it "should result in player 1 winning" do
        @game.place_mark("X","c1")
        @game.place_mark("X","b2")
        @game.place_mark("X","a3")
        expect(@game.winner).to eql("X")
      end
    end
  end

  context "after initializing a new game" do
    let(:game) {TicTacToe.new}
    it "should respond to the play_game method" do
      expect(game).to respond_to(:play_game)
    end    
  end
end
