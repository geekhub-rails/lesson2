class Pet
  def initialize name, kind
    @name = name
    @kind = kind
    @cheerfulness = 5
    @fullness = 5   
    @crap = 0    
    @shit = 0     
    @joy = 5      
    @communication = 5  
    @age = 1      
    @ageCount = 0
    @health = 10
  end

  def showCommands
    puts '*********'
    puts 'Commands:'
    puts 'exit'
    puts 'sleep'
    puts 'feed'
    puts 'walk'
    puts 'clean'
    puts 'play'
    puts 'cure'
    puts 'observe'
    puts 'help'
    puts '*********'
  end

  def putToBed
    passageOfTime
    puts 'You are putting ' + @name + ' to bed'
    if @cheerfulness < 10     
      @cheerfulness = 10
      puts @name + ' is falling asleep...'
      puts 'sniff...'*3
    else
      puts @name + ' cannot sleep'
    end
    show
  end

  def feed
    passageOfTime
    puts 'You are feeding ' + @name + '...'
    if @fullness < 10     
      @fullness = 10
      puts @name + ' is full'
    else
      puts @name + ' is eating but he is vomiting simultaneously beacause he is full'
    end
    show
  end

  def walk
    passageOfTime
    puts 'You are walking with ' + @name + '...'
    @crap = 0
    @joy += 2
    @communication += 1

    @joy = maxTen @joy    
    @communication = maxTen @communication
    show
  end

  def cleanShit
    passageOfTime
    puts 'You are cleaning the shit on the floor... Fine perfume'
    @shit = 0
    show
  end

  def play
    passageOfTime
    puts 'You are playing with ' + @name
    @joy += 2
    @communication += 3

    @joy = maxTen @joy    
    @communication = maxTen @communication
    show
  end

  def cure
    passageOfTime
    puts 'You are curing ' + @name + '...'
    @joy = 3
    @health = 10
    show
  end

  def observe
    passageOfTime
    random = rand(13)
    case random
    when 1
      sound
    when 2
      puts @name + ' is looking for something...'
      puts @name + ' found a treasure. You are rich!'
    when 3
      puts @name + ' is sitting and looking at you'
    when 4
      puts @name + ' ate something and choked! You must help him!'
      @health = 2
    when 5
      sound
    when 6
      sound
    when 7
      puts @name + ' is laying and waving its tail'
    when 8
      sound
    else
      puts 'Nothing happens...'   
    end   
  end

  private

  def sound
    if @kind == 'dog'
      puts @name + ' is loud barking!'
    elsif @kind == 'cat'
      puts @name + ' is loud meowing!'
    elsif @kind == 'hamster'
      puts @name + ' is running in the wheel.'
    elsif @kind == 'tiger'
      puts @name + ' is loud roars!'      
    end
  end

  def maxTen x
    if x > 10
      x = 10
    end
    x
  end

  def passageOfTime
    @cheerfulness -= 1
    @fullness -= 1
    @crap += 1    
    @joy -= 1
    @communication -= 1
    @ageCount += 1
    
    if @cheerfulness < 3
      puts @name + ' is sooo sleepy!'
    end
    if @cheerfulness <= 0
      puts @name + ' fell and fell asleep'  
      @cheerfulness = 10
      puts 'sniff...'*3   
    end

    if @fullness < 3
      puts @name + ' is sooo hungry!'
    end
    if @fullness <= 0
      puts @name + ' died of starvation :('
      exit
    end

    if @crap >= 7 and @crap <=9
      puts @name + ' is going to crap now...'
    elsif @crap == 10
      puts @name + ' is making shit now...'     
      @crap = 0
      @shit += 1
      if @shit <= 3
        puts 'You must to clean floor of the shit'
      elsif @shit == 4
        puts @name + ' covered in shit. He is running by the room and dirtying walls by shit. Cool!'
      elsif @shit == 5
        puts @name + ' could not stand it and left you..'
        exit
      end
      
    end

    if @joy < 3
      puts @name + ' is disappointed...'
    end
    if @joy <= 0
      puts @name + ' had gone from you.'
      exit
    end

    if @communication < 3
      puts @name + ' needs communication...'
    end
    if @communication <= 0
      puts @name + ' left you in the search for new friends.'     
    end

    if @ageCount == 4
      @ageCount = 0
      @age += 1
      if @age <= 5
        puts 'It is birthday time! ' + @name + ' is ' + @age.to_s + ' years old already!'
      else
        puts @name + ' died of old age :('
        exit
      end       
    end   
  end

  def show
    puts 
    puts '**************************************************'
    puts 'cheerfulness: ' +  @cheerfulness.to_s + '0%'
    puts 'fullness: ' +    @fullness.to_s + '0%' 
    puts 'crap: ' +      @crap.to_s + '0%' 
    puts 'shit: ' +      @shit.to_s + '0%' 
    puts 'joy: ' +       @joy.to_s + '0%' 
    puts 'communication: ' + @communication.to_s + '0%' 
    puts 'age: ' +       @age.to_s + '0%' 
    puts '**************************************************'
    puts 
  end
end



puts 'Welcome to tamagotchi!'
puts 'What kind of pet do you want? (dog, cat, hamster, tiger)'
kind = ''
loop do
  kind = gets.chomp.downcase
  break if kind == 'dog' or kind == 'cat' or kind == 'hamster' or kind == 'tiger'
  puts 'Error, try again'
end

puts 'What is your pet name?'
name = gets.chomp.capitalize

pet = Pet.new name, kind

pet.showCommands

command = ''
while true
  command = gets.chomp
  case command
  when 'exit'
    exit
  when 'sleep'
    pet.putToBed
  when 'feed'
    pet.feed
  when 'walk'
    pet.walk
  when 'clean'
    pet.cleanShit
  when 'play'
    pet.play
  when 'cure'
    pet.cure
  when 'observe'
    pet.observe
  when 'help'
    pet.showCommands
  else
    puts 'There is not such command'
  end
end