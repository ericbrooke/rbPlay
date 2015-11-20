# 1. Game has ten frames (or turns)
# 2. The goal is to knock down all 10 pins in each frame
# 3. Player gets 1 or 2 rolls per frame, except Frame 10 which could be 1 to 3 rolls
# 4. If a player knocks down less than 10 pins in a frame with 2 rolls, then you add up the total number of pins knocked down
# 5. If a Player knocks down 10 pins with the first roll, then this a STRIKE, and the player does not get a 2nd roll in a frame.
# the score for this frame is 10 plus the total number of pins knocked down in the next two rolls
# 6. If a player knocks down 10 pins with two rolls, then this is a SPARE. The score for this frame is 10 plus the total number of
# pins knocked  in the next roll
# 7.In the 10th frame, a strike in the 1st roll, results in two more rolls. A SPARE in the first
# two rolls results in 1 more roll. A non-STRIKE or non-SPARE in the first roll results in no more bonus rolls
# ./bowling_scorecard.rb Eric 6 2 7 1 10 9 0 8 2 10 10 3 5 7 2 5 5 8
# The put put should be a tally of per-frame scores in a table form
# X is a STRIKE
# / is a SPARE
# - is zero
# Extra frames in 10 should be represented as a *

class Bowling

  @max_frames = 10

  def init(*args)
    @name = ARGV[0].to_s
    @scores = ARGV[1..ARGV.length]
  end

  def total_score
    @total = @scores.inject{ |sum,x| sum + x }
  end

  def work_through_frames
    # Frame, Roll 1, Roll 2 and frame_score
    1..@max_frames.each do |frame|
      work_through_rolls(frame) # unless frame = 10
    end
  end

  def work_through_rolls(frame)
    @scores.each_with_index do |score| #needs to only look at current frame which is 1..2 rolls
      # has knocked 10 pins in first ball? move to next frame unless frame 10. This is a STRIKE
      allocate_strike(frame,score) if score == 10
      # has less then 10 pins, player has another roll
      allocate_two_rolls unless two_scores == 10
      # with 2 balls does player have 10 points? yes is a SPARE
      allocate_spare if two_scores == 10
    end
  end

  def allocate_strike
    # put x into the array and move to the next frame
  end

  def allocate_two_rolls
    # put two scores into the array and move to the next frame
    # any score is zero allocate -
  end

  def allocate_spare
    # put - into the array and move to the next frame
  end

end
