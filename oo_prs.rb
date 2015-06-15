#Two Players pick a hand that is either "paper", "rock", or "scissors". Then two players compare what choice was selected
#and it's either a tie when hands are the same or p > r, r >s, s > p."


require 'pry'

class Hand
  include Comparable
  attr_reader :value


  def initialize(v)
    @value = v
  end

  def <=>(another_hand)
    if @value == another_hand.value
      0
    elsif (@value == 'p' && another_hand.value == 'r') || (@value == 'r' && another_hand.value == 's') || 
      (@value == 's' && another_hand.value == 'p')
      1
    else
      -1
    end

    def display_winning_message
      case @value
        when 'p'
      puts "Paper covers Rock"
    when 'r'
      puts  "Rock crushes Scissors!"
    when 's'
      puts  "Scissor's cuts Paper!"
  end
end 


        
  end
 end

class Player
  

  attr_accessor :choice
  attr_reader :name

  def initialize(n)
    @name = n
  end

  def to_s
    "#{name} currently has a choice of #{choice}!"
  end
end

class Human < Player
binding.pry
  def pick_hand
    begin
      puts 'Pick one: (p,r,s)'
      c = gets.chomp.downcase
    end until Game::CHOICES.keys.include?(c)

    self.hand = Hand.new(c)
  end
end

class Computer < Player
  def pick_hand
    self.choice = Game::CHOICES.keys.sample
  end
end


class Game
  CHOICES = {'p'=> 'paper', 'r' => 'rock', 's' => 'scissors'}

  attr_reader :player, :computer

  def initialize
    @player = Human.new("Bob")
    @computer = Computer.new("R2D2")
  end

  def compare_hands
    if player.hand == computer.hand
      puts "It's a tie!"
    elsif player.hand > computer.hand
      puts "#{player.name} won!"
    else
      puts "#{computer.name} won!"
    end
      
  end

  def play
    player.pick_hand
    computer.pick_hand
    compare_hands
  end
end

game = Game.new.play

