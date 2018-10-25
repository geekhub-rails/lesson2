class Ball
  POSITIVE = ['It is certain',
              'It is decidedly so',
              'Without a doubt',
              'Yes — definitely',
              'You may rely on it']
  HZ = ['As I see it, yes',
        'Most likely',
        'Outlook good',
        'Signs point to yes',
        'Yes']
  NEITRAL =  ['Reply hazy, try again',
              'Ask again later',
              'Better not tell you now',
              'Cannot predict now',
              'Concentrate and ask again']
  NEGATIVE = ['Don’t count on it',
              'My reply is no',
              'My sources say no',
              'Outlook not so good',
              'Very doubtful']

  def shake
    all_ansvers = [POSITIVE, HZ, NEITRAL, NEGATIVE]
    random_emotion = all_ansvers[rand(all_ansvers.size)]
    ansver = random_emotion[rand(random_emotion.size)]
    # puts "\n\n"
    give_color(random_emotion, ansver)
    # puts "\n\n"
  end

  def give_color(str, ansv)
    if str == POSITIVE
      puts ansv.to_s.light_blue
    elsif str == HZ
      puts ansv.to_s.light_green
    elsif str == NEITRAL
      puts ansv.to_s.light_yellow
    else
      puts ansv.to_s.light_red
    end
  end
end


