# I’m taken back to the artist show page where I see the new song that I just created.

require 'rails_helper'

RSpec.describe 'Add New Song' do
  it "can create a new song" do
    michael_jackson = Artist.create(name: "Michael Jackson")

    visit "/artists/#{michael_jackson.id}"

    click_link "New Song"

    expect(current_path).to eq("/artists/#{michael_jackson.id}/songs/new")

    fill_in "Title", with: "Billy Jean"
    fill_in "Play count", with: 5678654
    fill_in "Length", with: 600

    click_button "Create Song"

    expect(current_path).to eq("/artists/#{michael_jackson.id}")
    expect(page).to have_content("Billy Jean")
    expect(page).to have_content("Play Count: 5678654")
    expect(page).to have_content("Length: 600")
  end
end
