require 'rails_helper'

RSpec.describe Contestant, type: :model do
  describe 'relationships' do
    it { should belong_to(:bachelorette) }
    it { should have_many(:outing_contestants) }
    it { should have_many(:outings).through(:outing_contestants) }
  end

  describe '.class methods' do
    before :each do
      @bachelorette_1 = Bachelorette.create!(name: 'Hannah Brown', season_number: 15, description: 'Season 15 - The MOST Dramatic Season Yet!')
      @bachelorette_2 = Bachelorette.create!(name: 'Katie', season_number: 17, description: 'Season 17 - Most dramatic season ever!')

      @contestant_1 = @bachelorette_1.contestants.create!(name: 'Gunnar', age: 20, hometown: 'Denver, CO')
      @contestant_2 = @bachelorette_1.contestants.create!(name: 'Randy', age: 25, hometown: 'Charleston, SC')
      @contestant_3 = @bachelorette_1.contestants.create!(name: 'Jon', age: 26, hometown: 'New York, NY')
      @contestant_4 = @bachelorette_1.contestants.create!(name: 'George', age: 24, hometown: 'Portland, OR')
      @contestant_5 = @bachelorette_2.contestants.create!(name: 'Ben', age: 30, hometown: 'Kalamazoo, MI')
    end

    describe '.average_age' do
      it 'can find the average age of contestants' do
        expect(Contestant.average_age).to eq(25.0)
      end
    end
  end
end
