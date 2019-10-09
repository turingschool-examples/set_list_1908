require 'rails_helper'

RSpec.describe "New Artist" do
  describe "as a visitor" do
    describe "when I visit the new artist form by clicking new artist" do
      it "creates a new artist" do
        visit '/artists'

        click_link 'New Artist'

        expect(current_path).to eq('/artists/new')

        fill_in 'Name', with: 'Whitney Houston'
        click_on 'Create Artist'

        expect(current_path).to eq('/artists')
        expect(page).to have_content('Whitney Houston')
      end

      it 'cant create an artist without a name' do
        visit '/artists/new'

        click_on 'Create Artist'

        expect(page).to have_content("Artist not created, fill in all fields.")
        expect(page).to have_button("Create Artist")
      end
    end
  end
end
