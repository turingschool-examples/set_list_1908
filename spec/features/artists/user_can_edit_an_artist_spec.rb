require 'rails_helper'

RSpec.describe "Edit artist" do
  describe "as a visitor" do
    describe "when i visit artist index" do
      it "can update an artist" do
        artist = Artist.create(name: "Prince")

        visit '/artists'

        click_link 'Edit'

        expect(current_path).to eq("/artists/#{artist.id}/edit")

        fill_in 'Name', with: 'The Artist Formerly Known As Prince'

        click_on 'Update Artist'

        expect(current_path).to eq('/artists')
        expect(page).to have_content('The Artist Formerly Known As Prince')
      end
      it 'cant update an artist without a name' do
        artist = Artist.create(name: "Prince")

        visit "/artists/#{artist.id}/edit"

        click_on 'Update Artist'

        expect(page).to have_content("Artist not updated, fill in all fields.")
        expect(page).to have_button("Update Artist")
      end
    end
  end
end
