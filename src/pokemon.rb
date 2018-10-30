class Pokemon
  RANDOM_ANSWER = {
    'feed' => {
      'well' => [
        'наелся.',
        'отлично покушал :)'
      ],
      'bad' => [
        'не понравилась еда.',
        'не наелся и хочет покушать еще.',
        'подавился, но вы успели ему помочь.'
      ],
      'oops' => [
        'отравился и погиб.',
        'подавился и погиб'
      ]
    },
    'walk' => {
      'well' => [
        'отлично провел время.',
        'хорошо прогулялся.'
      ],
      'bad' => [
        'упал в яму и повредил ногу.',
        'не нравится погода и он хочет домой.'
      ],
      'oops' => [
        'потерялся.',
        'убежал.'
      ]
    },
    'sleep' => {
      'well' => [
        'выспался.'
      ]
    },
    'watch' => {
      'well' => [
        'улыбается и радуется жизни.'
      ]
    },
    'fight' => {
      'well' => [
        'легко одержал победу над противником.',
        'победил.'
      ]
    }
  }

  RANDOM_ACTION = {
    'feed' => [
      'feed_well',
      'feed_bad',
      'feed_oops'
    ],
    'walk' => [
      'walk_well',
      'walk_bad',
      'walk_oops'
    ],
    'sleep' => [
      'sleep_well'
    ],
    'watch' => [
      'watch_well'
    ],
    'fight' => [
      'fight_well'
    ]
  }

  POKEMON_TYPES = {
    'fiery' => {
      'max_health' => 10,
      'damage' => 10
    },
    'earthy' => {
      'max_health' => 15,
      'damage' => 5
    },
    'water' => {
      'max_health' => 12,
      'damage' => 7
    }
  }

  def initialize(name, type)
    @name = name
    @is_dead = false
    @is_sleep = false
    @mood = 5
    @water = 5
    @food = 5
    @energy = 5
    @money = 10

    initialize_type(type)

    puts @name + ' родился.'
  end

  public

  def info
    puts "Name: #{@name}"
    puts "Type: #{@type}"
    puts "Health: #{@health}"
    puts "Max health: #{@max_health}"
    puts "Water: #{@water}"
    puts "Food: #{@food}"
    puts "Energy: #{@energy}"
    puts "Money: #{@money}"
  end

  def help
    puts 'Список доступных команд:'
    puts ' help'
    puts ' info'
    puts ' feed'
    puts ' walk'
    puts ' sleep'
    puts ' watch'
    puts ' fight'
  end

  def feed()
    if @is_dead
      puts @name + ' мертв.'
    else
      puts 'Вы кормите ' + @name
      passage_of_time('feed')
    end
  end

  def walk
    if @is_dead
      puts @name + ' мертв.'
    else
      puts 'Вы выгуливаете ' + @name
      passage_of_time('walk')
    end
  end

  def sleep
    if @is_dead
      puts @name + ' мертв.'
    else
      puts 'Zzzzz....'
      passage_of_time('sleep')
    end
  end

  def watch
    if @is_dead
      puts @name + ' мертв.'
    else
      puts 'Вы наблюдаете за ' + @name
      passage_of_time('watch')
    end
  end

  def fight
    if @is_dead
      puts @name + ' мертв.'
    else
      if @health < 5
        puts 'У вашего покемона слишком мало жизней для сражения.'
      else
        passage_of_time('fight')
      end
    end
  end

  private

  def initialize_type(type)
    pokemon_skills = POKEMON_TYPES[type]
    @type = type
    @health = pokemon_skills['max_health']
    @max_health = pokemon_skills['max_health']
    @damage = pokemon_skills['damage']
  end

  def rand_number(a, b)
    rand(b - a) + a
  end

  def get_random_answer(action, state)
    @name + ' ' + RANDOM_ANSWER[action][state][rand_number(0, RANDOM_ANSWER[action][state].length)]
  end

  def get_random_action(action)
    RANDOM_ACTION[action][rand_number(0, RANDOM_ACTION[action].length)]
  end

  def passage_of_time(action)
    if @health.zero?
      puts "#{@name} погиб."
    elsif @food.zero?
      puts "#{@name} погиб от голода"
    elsif @energy.zero?
      puts "#{@name} устал и пошел спать."
      sleep
    elsif @health < 3 && @mood < 3 && @water < 3 && @food < 3
      puts "#{@name} убежал от вас потому что вы о нем не заботились."
    else
      self.send(get_random_action(action))
    end
  end

  def feed_well
    random = rand_number(1, 5)
    food = @food + random
    health = @health + random
    @food = food >= 10 ? 10 : food
    @health = health > @max_health ? @max_health : health
    puts get_random_answer('feed', 'well')
  end

  def feed_bad
    puts get_random_answer('feed', 'bad')
  end

  def feed_oops
    @health = 0
    puts get_random_answer('feed', 'oops')
  end

  def walk_well
    mood = @mood + 2
    energy = @energy - 2
    water = @water - 2
    @mood = mood >= 10 ? 10 : mood
    @energy = energy < 0 ? 0 : energy
    @water = water < 0 ? 0 : water
    puts get_random_answer('walk', 'well')
  end

  def walk_bad
    puts get_random_answer('walk', 'bad')
  end

  def walk_oops
    @health = 0
    puts get_random_answer('walk', 'bad')
  end

  def sleep_well
    energy = @energy + 5
    water = @water - 2
    @energy = energy >= 10 ? 10 : energy
    @water = water < 0 ? 0 : water
    puts get_random_answer('sleep', 'well')
  end

  def watch_well
    energy = @energy + 5
    @energy = energy >= 10 ? 10 : energy
    puts get_random_answer('watch', 'well')
  end

  def fight_well
    random = rand_number(1, 5)
    @money += random
    @health -= 1
    puts get_random_answer('fight', 'well')
  end
end
