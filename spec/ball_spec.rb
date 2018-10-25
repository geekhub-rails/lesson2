require 'colorize'
require_relative '../lib/ball'

RSpec.describe Ball do
  let(:ball){Ball.new}
  subject{ball.shake}

  it "returns string" do
    expect(subject).to be_a(String)
  end

  it "has color" do
    colors = ["\e[0;91;49m", "\e[0;93;49m", "\e[0;94;49m", "\e[0;92;49m"]
    has_any_color = colors.any?{| el | subject.include?(el) }
    expect(has_any_color).to eq(true)
  end

end
