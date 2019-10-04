require 'rails_helper'
# As a user
# When I visit an artists show page
# I see that artists name
# As well as a list of all of their songs(including the songs title, length, and play count)

RSpec.describe 'Artist show page' do
  it 'lists all artists' do
    michael_jackson = Artist.create(name: "Michael Jackson")
    thriller = michael_jackson.songs.create(title: "Thriller", play_count: 1234543, length: 68)
    billy_jean = michael_jackson.songs.create(title: "Billy Jean", play_count: 8765, length: 97)

    visit "/artists/#{michael_jackson.id}"

    expect(page).to have_content("Michael Jackson")
    expect(page).to have_content(thriller.title)
    expect(page).to have_content("Play Count: 1234543")
    expect(page).to have_content("Length: 68")
    expect(page).to have_content("Billy Jean")
    expect(page).to have_content("Play Count: 8765")
    expect(page).to have_content("Length: 97")
  end
end
