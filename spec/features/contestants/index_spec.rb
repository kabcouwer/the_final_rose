require 'rails_helper'

RSpec.describe 'contestants index page' do
  before :each do
    @bachelorette_1 = Bachelorette.create!(name: 'Hannah Brown', season_number: 15, description: 'Season 15 - The MOST Dramatic Season Yet!')
    @bachelorette_2 = Bachelorette.create!(name: 'Katie', season_number: 17, description: 'Season 17 - Most dramatic season ever!')

    @contestant_1 = @bachelorette_1.contestants.create!(name: 'Gunnar', age: 25, hometown: 'Denver, CO')
    @contestant_2 = @bachelorette_1.contestants.create!(name: 'Randy', age: 31, hometown: 'Charleston, SC')
    @contestant_3 = @bachelorette_1.contestants.create!(name: 'Jon', age: 28, hometown: 'New York, NY')
    @contestant_4 = @bachelorette_1.contestants.create!(name: 'George', age: 30, hometown: 'Portland, OR')
    @contestant_5 = @bachelorette_2.contestants.create!(name: 'Ben', age: 21, hometown: 'Kalamazoo, MI')

    visit "bachelorettes/#{@bachelorette_1.id}/contestants"
  end

  it 'displays that bachelorettes contestants and their attributes' do
    expect(page).to have_content('Contestants')
    expect(page).to have_content(@contestant_1.name)
    expect(page).to have_content(@contestant_2.name)
    expect(page).to have_content(@contestant_3.name)
    expect(page).to have_content(@contestant_4.name)
    expect(page).to have_no_content(@contestant_5.name)

    within "#contestant-#{@contestant_1.id}" do
      expect(page).to have_content(@contestant_1.age)
      expect(page).to have_content(@contestant_1.hometown)
    end

    within "#contestant-#{@contestant_2.id}" do
      expect(page).to have_content(@contestant_2.age)
      expect(page).to have_content(@contestant_2.hometown)
    end
  end

  it 'has a link for each contestant (name) that goes to that contestants show page' do
    expect(page).to have_link(@contestant_1.name)
    expect(page).to have_link(@contestant_2.name)

    click_link("#{@contestant_1.name}")

    expect(current_path).to eq("/bachelorettes/#{@bachelorette_1.id}/contestants/#{@contestant_1.id}")

  end
end
