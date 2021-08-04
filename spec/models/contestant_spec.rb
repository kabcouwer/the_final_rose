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

      @contestant_1 = @bachelorette_1.contestants.create!(name: 'Gunnar', age: 20, hometown: 'Denver, CO')
      @contestant_2 = @bachelorette_1.contestants.create!(name: 'Randy', age: 25, hometown: 'Charleston, SC')
      @contestant_3 = @bachelorette_1.contestants.create!(name: 'Jon', age: 26, hometown: 'New York, NY')
      @contestant_4 = @bachelorette_1.contestants.create!(name: 'George', age: 24, hometown: 'Portland, OR')
      @contestant_5 = @bachelorette_1.contestants.create!(name: 'Ben', age: 30, hometown: 'Denver, CO')
    end

    describe '.average_age' do
      it 'can find the average age of contestants' do
        expect(Contestant.average_age).to eq(25.0)
      end
    end

    describe '.unique_hometowns' do
      it 'can output unique hometowns for contestants' do
        # binding.pry
        expect(Contestant.unique_hometowns.length).to eq(4)
        expect(Contestant.unique_hometowns.first.hometown).to eq(@contestant_2.hometown)
        expect(Contestant.unique_hometowns.last.hometown).to eq(@contestant_4.hometown)
      end
    end
  end
end
