require 'rails_helper'

RSpec.describe 'bachelorette show page' do
  before :each do
    @bachelorette_1 = Bachelorette.create!(name: 'Hannah Brown', season_number: 15, description: 'Season 15 - The MOST Dramatic Season Yet!')
    @bachelorette_2 = Bachelorette.create!(name: 'Katie', season_number: 17, description: 'Season 17 - Most dramatic season ever!')

    @contestant_1 = @bachelorette_1.contestants.create!(name: 'Gunnar', age: 25, hometown: 'Denver, CO')
    @contestant_2 = @bachelorette_1.contestants.create!(name: 'Randy', age: 31, hometown: 'Charleston, SC')
    @contestant_3 = @bachelorette_1.contestants.create!(name: 'Jon', age: 28, hometown: 'New York, NY')
    @contestant_4 = @bachelorette_1.contestants.create!(name: 'George', age: 30, hometown: 'Portland, OR')
    @contestant_5 = @bachelorette_2.contestants.create!(name: 'Ben', age: 21, hometown: 'Kalamazoo, MI')

    visit "bachelorettes/#{@bachelorette_1.id}"
  end

  it 'displays the bachelorette and their attributes' do
    expect(page).to have_content(@bachelorette_1.name)
    expect(page).to have_content("Season: #{@bachelorette_1.season_number}")
    expect(page).to have_content("Description: #{@bachelorette_1.description}")
  end

  it 'has a link to that bachelorettes contestants' do
    expect(page).to have_link('See Contestants')
    click_link('See Contestants')

    expect(current_path).to eq("/bachelorettes/#{@bachelorette_1.id}/contestants")
  end
end
