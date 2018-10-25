require 'colorize'
require_relative '../lib/ball'

RSpec.describe Ball do
  before { Ball.any_instance.stub(:puts) }

  let(:ball) { Ball.new }

  subject { ball.shake }

  it 'returns string' do
    is_expected.to be_a(String)
  end

  context 'colors' do
    let(:colors) { ["\e[0;91;49m", "\e[0;93;49m", "\e[0;94;49m", "\e[0;92;49m"] }

    it 'has color' do
      has_any_color = colors.any? { |el| subject.include?(el) }
      expect(has_any_color).to eq(true)
    end

    context 'all_colors' do
      subject { (1..100).map { Ball.new.shake } }
      it 'return_all_colors' do
        has_every_color = colors.all? { |el| subject.join.include?(el) }
        expect(has_every_color).to eq(true)
      end
    end
  end
end
