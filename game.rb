require_relative './pet'

class Game
  def initialize
    p 'Hello, lets play)'
    p 'Put the name of your dog'
    name = gets.chomp
    @pet = Pet.new(name)

    choose_action
  end

  def choose_action
    action = gets.chomp

    if @pet.respond_to? action
      @pet.public_send(action)
    else
      p 'sorry there no such action, try put `help`'
    end

    choose_action
  end
end

Game.new
