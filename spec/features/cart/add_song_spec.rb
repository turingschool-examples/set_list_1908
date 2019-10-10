require 'rails_helper'

RSpec.describe "When a user adds songs to their cart" do
  it "displays a message" do
    artist = Artist.create(name: "Rick Astley")
    song_1 = artist.songs.create(title: "Never Gonna Give You Up", play_count: 50, length: 30)
    song_2 = artist.songs.create(title: "Together Forever", play_count: 45, length: 80)

    visit "/songs"

    within("#song-#{song_1.id}") do
      click_button("Add Song")
    end

    within("#song-#{song_2.id}") do
      click_button("Add Song")
    end

    within("#song-#{song_1.id}") do
      click_button("Add Song")
    end

    expect(page).to have_content("You now have 2 copies of #{song_1.title}")
  end

  it "displays total number of items in cart" do

    artist = Artist.create(name: "Rick Astley")
    song_1 = artist.songs.create(title: "Never Gonna Give You Up", play_count: 50, length: 30)
    song_2 = artist.songs.create(title: "Together Forever", play_count: 45, length: 80)

    visit "/songs"

    expect(page).to have_content("Cart: 0")

    within("#song-#{song_1.id}") do
      click_button("Add Song")
    end

    expect(page).to have_content("Cart: 1")

    within("#song-#{song_2.id}") do
      click_button("Add Song")
    end

    expect(page).to have_content("Cart: 2")

    within("#song-#{song_1.id}") do
      click_button("Add Song")
    end

    expect(page).to have_content("Cart: 3")

  end

end
