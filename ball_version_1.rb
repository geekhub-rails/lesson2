class String
  def colorize(color_code)
    "\e[#{color_code}m#{self}\e[0m"
  end

  def red
    colorize(31)
  end

  def green
    colorize(32)
  end

  def yellow
    colorize(33)
  end

  def blue
    colorize(34)
  end
end

class Ball
  def shake
    red_answers = ["Don't count on it",
                   'My reply is no',
                   'My sources say no',
                   'Outlook not so good',
                   'Very doubtful']

    green_answers = ['As I see it, yes',
                     'Most likely',
                     'Outlook good',
                     'Signs point to yes']

    yellow_answers = ['Reply hazy, try again',
                      'Ask again later',
                      'Better not tell you now',
                      'Cannot predict now',
                      'Concentrate and ask again']

    blue_answers = ['It is certain',
                    'It is decidedly so',
                    'Without a doubt',
                    'Yes - definitely',
                    'You may rely on it']

    shake = [red_answers[rand(5)].red,
             green_answers[rand(4)].green,
             yellow_answers[rand(5)].yellow,
             blue_answers[rand(5)].blue]

    puts shake[rand(4)].to_s
  end
end
Ball.new.shake
