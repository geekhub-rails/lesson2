require 'yaml'

class Ball
  ANSWERS = YAML.load_file(File.join(__dir__, './answers.yml'))
  GROUP_SIZE = 5
  FOREGROUND_OFFSET = 31

  def colorize(answer)
    color_index = ANSWERS.find_index(answer) / GROUP_SIZE
    "\e[#{FOREGROUND_OFFSET + color_index}mANSWER\e[0m"
  end

  def shake
    answer = ANSWERS.sample
    puts colorize(answer)
    answer
  end
end
