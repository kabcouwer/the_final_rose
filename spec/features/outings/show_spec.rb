require 'rails_helper'

RSpec.describe 'outing show page' do
  before :each do
    @bachelorette_1 = Bachelorette.create!(name: 'Hannah Brown', season_number: 15, description: 'Season 15 - The MOST Dramatic Season Yet!')
    @bachelorette_2 = Bachelorette.create!(name: 'Katie', season_number: 17, description: 'Season 17 - Most dramatic season ever!')

    @contestant_1 = @bachelorette_1.contestants.create!(name: 'Gunnar', age: 25, hometown: 'Denver, CO')
    @contestant_2 = @bachelorette_1.contestants.create!(name: 'Randy', age: 31, hometown: 'Charleston, SC')

    @outing_1 = Outing.create!(name: 'Kickball', location: 'Mansion')
    @outing_2 = Outing.create!(name: 'Hot Springs', location: 'Taos, NM')
    @outing_3 = Outing.create!(name: 'Heli Ride', location: 'Bali')
    @outing_4 = Outing.create!(name: 'Dinner', location: 'Italian Restaurant')

    @outing_contestant_1 = OutingContestant.create!(outing_id: @outing_1.id, contestant_id: @contestant_1.id)
    @outing_contestant_2 = OutingContestant.create!(outing_id: @outing_1.id, contestant_id: @contestant_2.id)
    @outing_contestant_3 = OutingContestant.create!(outing_id: @outing_2.id, contestant_id: @contestant_1.id)
    @outing_contestant_4 = OutingContestant.create!(outing_id: @outing_2.id, contestant_id: @contestant_2.id)
    @outing_contestant_5 = OutingContestant.create!(outing_id: @outing_3.id, contestant_id: @contestant_2.id)
    @outing_contestant_6 = OutingContestant.create!(outing_id: @outing_4.id, contestant_id: @contestant_1.id)

    visit ("outings/#{@outing_1.id}")
  end

  it 'displays the outings name, location, and date' do
    expect(page).to have_content(@outing_1.name)
    expect(page).to have_content("Location: #{@outing_1.location}")
    expect(page).to have_content("Date time: #{@outing_1.created_at}")
    expect(page).to have_content("Number of contestants: #{@outing_1.contestants.count}")
  end

  it 'display the number of contestants on date and thier names' do
    expect(page).to have_content(@contestant_1.name)
    expect(page).to have_content(@contestant_2.name)
  end
end
