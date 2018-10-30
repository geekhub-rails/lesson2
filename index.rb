require_relative './src/pokemon'

class Game
  def initialize
    start
  end

  def start
    puts 'Добро пожаловать!'
    print 'Введите имя покемона: '
    name = gets.chomp
    print 'Введите тип покемона (water, fiery, earthy): '
    type = gets.chomp

    pokemon = Pokemon.new(name, type)

    command = ''

    until command == 'exit'
      print 'Введите команду: '
      command = gets.chomp

      if pokemon.respond_to?(command)
        pokemon.send(command)
      elsif command == 'exit'
        exit
      else
        puts command + ' неизвестная команда.'
        print 'Что бы получить полный '
        puts 'список команд введите help'
      end
    end
  end

  def exit
    puts 'Пока :)'
    command = ''
    until command == 'start'
      puts 'Что бы заупстить игру заново введите start.'
      command = gets.chomp
      if command == 'start'
        start
      end
    end
  end
end

Game.new
