require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'I visit a song show page' do
    it 'then I only see the songs title and artist' do
      artist = Artist.create!(name: "Space Hog")
      song_1 = artist.songs.create(title: "Cruel to be Kind", play_count: 1, length: 30)
      song_2 = artist.songs.create(title: "In the Meantime", play_count: 5, length: 15)

      visit "/songs/#{song_1.id}"

      expect(page).to have_content(song_1.title)
      expect(page).to have_content("By: #{artist.name}")
      expect(page).to_not have_content(song_2.title)

    end
  end
end
