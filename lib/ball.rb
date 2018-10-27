class Ball
  POSITIVE = [
    'It is certain',
    'It is decidedly so',
    'Without a doubt',
    'Yes — definitely',
    'You may rely on it'
  ]
  WEAK = [
    'As I see it, yes',
    'Most likely',
    'Outlook good',
    'Signs point to yes',
    'Yes'
  ]
  NEUTRAL = [
    'Reply hazy, try again',
    'Ask again later',
    'Better not tell you now',
    'Cannot predict now',
    'Concentrate and ask again'
  ]
  NEGATIVE = [
    'Don’t count on it',
    'My reply is no',
    'My sources say no',
    'Outlook not so good',
    'Very doubtful'
  ]

  def shake
    all_ansvers = [POSITIVE, WEAK, NEUTRAL, NEGATIVE]
    random_emotion = all_ansvers[rand(all_ansvers.size)]
    ansver = random_emotion[rand(random_emotion.size)]
    puts "\n"
    answer_message = give_color(random_emotion, ansver)
    puts answer_message
    puts "\n"

    answer_message
  end

  def give_color(str, ansv)
    if str == POSITIVE
      ansv.to_s.light_blue
    elsif str == WEAK
      ansv.to_s.light_green
    elsif str == NEUTRAL
      ansv.to_s.light_yellow
    else
      ansv.to_s.light_red
    end
  end
end
