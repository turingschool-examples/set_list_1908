require 'rails_helper'

RSpec.describe "songs index page", type: :feature do
  it "can see all songs titles and play count" do
    carly_rae = Artist.create(name: "Carly Rae")
    brittney_spears = Artist.create(name: "Brittney Spears")
    song_1 = Song.create(title:       "I Really Like You",
                         length:      208,
                         play_count:  243810867,
                        artist_id: carly_rae.id)
    song_2 = carly_rae.songs.create(title:       "Call Me Maybe",
                         length:      199,
                         play_count:  1214772)

    brittney_spears.songs << Song.create(title:       "Crazy",
                         length:      399,
                         play_count:  12178762)

    visit "/songs"

    expect(page).to have_content(song_1.title)
    expect(page).to have_content("Play Count: #{song_1.play_count}")
    expect(page).to have_content(song_2.title)
    expect(page).to have_content("Play Count: #{song_2.play_count}")
  end
end
