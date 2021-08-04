require 'rails_helper'

RSpec.describe 'contestants show page' do
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

    visit "bachelorettes/#{@bachelorette_1.id}/contestants/#{@contestant_1.id}"
  end

  it 'displays the contestants name, their season number, and description' do
    expect(page).to have_content(@contestant_1.name)
    expect(page).to have_content("Season: #{@bachelorette_1.season_number}")
    expect(page).to have_content(@bachelorette_1.description)
  end

  it 'displays the outings this contestant went on' do
    expect(page).to have_content('Outings:')
    expect(page).to have_content(@outing_1.name)
    expect(page).to have_content(@outing_2.name)
    expect(page).to have_content(@outing_4.name)
  end

  it 'has a link to each outings show page' do
    expect(page).to have_link(@outing_1.name)

    click_link(@outing_1.name)

    expect(current_path).to eq("/outings/#{@outing_1.id}")
  end
end
