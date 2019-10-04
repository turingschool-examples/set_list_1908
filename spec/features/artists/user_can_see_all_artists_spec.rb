require 'rails_helper'

RSpec.describe 'Artist index page' do
  it 'lists all artists' do
    artist = Artist.create(name: "Prince")
    artist = Artist.create(name: "Michael Jackson")

    visit '/artists'

    expect(page).to have_content("Prince")
    expect(page).to have_content("Michael Jackson")
  end
end
