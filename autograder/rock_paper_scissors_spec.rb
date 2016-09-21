require 'rock_paper_scissors'
require 'byebug'
describe RockPaperScissors do
  before(:each) do
    @rock = ['Armando','R'] ; @paper = ['Dave','P'] ; @scissors = ['Sam','S']
  end
  describe 'game' do
    it 'rock breaks scissors [10 points]', points: 10 do
      RockPaperScissors.winner(@rock, @scissors).should == @rock
    end
    it 'scissors cut paper [10 points]', points: 10 do
      RockPaperScissors.winner(@paper, @scissors).should == @scissors
    end
    it 'paper covers rock [10 points]', points: 10 do
      RockPaperScissors.winner(@rock, @paper).should == @paper
    end
    it 'first player wins if both use same strategy [10 points]', points: 10 do
      RockPaperScissors.winner(@scissors, ['Dave','S']).should == @scissors
    end
  end
  it "should raise NoSuchStrategyError if strategy isn't R, P, or S [10 points]", points: 10 do
    lambda { RockPaperScissors.winner(@rock, ['Dave', 'w']) }.
      should raise_error(RockPaperScissors::NoSuchStrategyError,
      "Strategy must be one of R,P,S")
  end
  describe 'tournament' do
    it 'base case [20 points]', points: 20 do
      RockPaperScissors.tournament_winner([@rock,@paper]).should == @paper
    end
    it 'recursive case [30 points]', points: 30 do
      tourney = [
        [
          [ ["Armando", "P"], ["Dave", "S"] ],      
          [ ["Richard", "R"], ["Michael", "S"] ]
        ],
        [
          [ ["Allen", "S"], ["Omer", "P"] ],
          [ ["David E.", "R"], ["Richard X.", "P"] ]
        ]
      ]
      RockPaperScissors.tournament_winner(tourney).should == ['Richard', 'R']
    end
  end
end