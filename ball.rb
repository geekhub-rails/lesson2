require 'yaml'

ANSWERS = YAML.load_file(File.join(__dir__, './answers.yml'))

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
    shake = rand(ANSWERS.size)
    case shake
    when 0..4
      puts ANSWERS[shake].red
    when 5..9
      puts ANSWERS[shake].green
    when 10..14
      puts ANSWERS[shake].yellow
    else puts ANSWERS[shake].blue
    end
  end
end

Ball.new.shake
