require 'yaml'

class Ball
  ANSWERS = YAML.load_file(File.join(__dir__, '../answers.yml'))

  def colorize(color_index, answer)
    "\e[#{31 + color_index}m#{answer}\e[0m"
  end

  def shake
    index = rand(ANSWERS.size)
    answer = ANSWERS[index]
    color_index = index / 5
    puts colorize(color_index, answer)
    answer
  end
end

ball = Ball.new

ball.shake
