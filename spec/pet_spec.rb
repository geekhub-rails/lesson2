require 'yaml'
require_relative '../pet'

RSpec.describe Pet do
  let(:pet) { Pet.new('Pushka') }

  it 'Should check js_skill inc' do
    expect(pet.instance_variable_get('@js_skill')).to eql(0)
    pet.study_js
    expect(pet.instance_variable_get('@js_skill')).to eql(1)
  end
  it 'Should check ruby_skill inc' do
    expect(pet.instance_variable_get('@ruby_skill')).to eql(0)
    pet.study_ruby
    expect(pet.instance_variable_get('@ruby_skill')).to eql(1)
  end
  it 'Should don`t inc ruby_skill if tired' do
    pet.instance_variable_set('@tired', 10)
    pet.study_ruby
    expect(pet.instance_variable_get('@ruby_skill')).to eql(0)
  end

  it 'should fill `@stuff_in_belly` on `feed`' do
    pet.instance_variable_set('@stuff_in_belly', 5)
    pet.feed
    expect(pet.instance_variable_get('@stuff_in_belly')).to eql(9)
  end

  it 'should reset tired if put_to_bed' do
    pet.instance_variable_set('@tired', 5)
    pet.put_to_bed
    expect(pet.instance_variable_get('@tired')).to eql(0)
  end
  it 'should reset @stuff_in_intestine if walk' do
    pet.instance_variable_set('@stuff_in_intestine', 5)
    pet.walk
    expect(pet.instance_variable_get('@stuff_in_intestine')).to eql(1)
  end
end
