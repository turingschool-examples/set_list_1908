require 'rails_helper'

RSpec.describe 'As a visitor' do
  it 'I can delete an artist' do
    artist = Artist.create(name: "Beyonce")

    visit '/artists'

    click_button 'Delete'

    expect(current_path).to eq('/artists')
    expect(page).to_not have_content('Beyonce')
    expect(page).to_not have_content('Delete')
  end
end
