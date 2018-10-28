class Pet
  def initialize(name)
    @name = name
    @type = 'DOG'
    @lives = 5
    @stuff_in_belly = 10
    @stuff_in_intestine = 0
    @tired = 0
    @mood = 'NORMAL'
    @ruby_skill = 0
    @js_skill = 0

    p "#{@name} was born"
  end

  def help
    p 'Here all available commands:'
    p 'name => display pet name'
    p 'study_ruby => learn Ruby language'
    p 'study_js => learn JS language'
    p 'walk => reset poop'
    p 'put_to_bed => reset tired'
    p 'just_watch => do nothing'
  end

  def info
    p "Name: #{@name}"
    p "Hungry: #{hungry?}"
    p "Poopy: #{poopy?}"
    p "JS: #{poopy?}"
  end

  def feed
    @stuff_in_belly = 10
    p 'I`m full'
    passage_of_time
  end

  def study_ruby
    if @tired < 10
      @ruby_skill += 1
      p 'Wow. Ruby is awesome!'

      if @ruby_skill == 10
        puts 'looks at you like a piece of shit'
        exit
      end
      passage_of_time
    end
  end

  def study_js
    if @tired < 10
      @js_skill += 1
      p 'I love JS!'

      if @js_skill == 10
        p 'looks at you like a piece of shit'
        exit
      end

      passage_of_time
    end
  end

  def walk
    p 'Waaaaaaalk!'
    @stuff_in_intestine = 0
    passage_of_time
  end

  def put_to_bed
    p 'Good night'
    @tired = 0

    passage_of_time
  end

  def just_watch
    p 'I`m boring, lets do something?'
    passage_of_time
  end

  private

  def passage_of_time
    @stuff_in_belly -= 1
    @stuff_in_intestine += 1

    if hungry
      if @stuff_in_belly == 0
        p 'i live you'
        exit
      else
        p 'I m hungry'
      end
    end

    if poopy
      if @stuff_in_intestine == 10
        p 'Oops'
        @stuff_in_intestine = 0
      else
        p 'Wanna poop'
      end
    end
  end

  def hungry
    @stuff_in_belly <= 2
  end

  def poopy
    @stuff_in_intestine >= 8
  end
end
