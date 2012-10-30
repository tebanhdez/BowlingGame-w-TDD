require 'bowlinggame.rb'

def game
  game ||= Bowlinggame.new
end

describe Bowlinggame do

  def rollMany(times, pins)
    for times in 1 .. times
     game.roll(pins) 
    end
  end

  def rollStrike()
    game.roll(10)
  end

  def rollSpare()
    game.roll(5)
    game.roll(5)
  end

  it "Roll none!" do
    rollMany(10,0)
    game.score().should eq(0)
  end

  it "Roll a Spare" do
    game.initGame()
    rollSpare()
    game.roll(3)
    game.score().should eq(16)
  end

  it "Roll a Strike" do
    game.initGame()
    rollStrike()
    game.roll(3)
    game.roll(4)
    game.score().should eq(24)
  end

  it "Play perfect game" do
    game.initGame()
    rollMany(12, 10)
    game.score().should eq(300)
  end

end
