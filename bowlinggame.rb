class Bowlinggame

  $rolls = Array.new(21,0)
  $currentRoll = 0

def initGame()  
  $rolls = Array.new(21,0)
  $currentRoll = 0
end
def roll(pins)
#  $currentRoll += 1
#  puts("Current roll: " + $currentRoll.to_s())
  $rolls[$currentRoll] = pins
  $currentRoll += 1
#  p $rolls
end

  def score()
    _score = 0
    _firstInFrame = 0
    for frame in 0 ... 10
      if(isStrike(_firstInFrame))
        _score += (10 + nextTwoBallsForStrike(_firstInFrame) )
        _firstInFrame+=1
      else
        if(isSpare(_firstInFrame))
          _score += 10 + nextBallForSpare(_firstInFrame)
          _firstInFrame+=2
        else
        _score+= twoBallsInFrame(_firstInFrame)
        _firstInFrame+=2
        end
      end
    end
    return _score
end

def twoBallsInFrame(firstInFrame)
  $rolls[firstInFrame] + $rolls[firstInFrame+1]
end

def nextBallForSpare(firstInFrame)
  $rolls[firstInFrame+2]
end

def isStrike(firstInFrame)
  $rolls[firstInFrame] == 10
end

def isSpare(firstInFrame)
  ($rolls[firstInFrame] + $rolls[firstInFrame+1]) == 10
end

def nextTwoBallsForStrike(firstInFrame)
  $rolls[firstInFrame+1] + nextBallForSpare(firstInFrame)
end
end
