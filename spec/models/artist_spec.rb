require 'rails_helper'

describe Artist, type: :model do
  #validations
  describe "validations" do
    it { should validate_presence_of :name}
  end

  #relationships
  describe "relationships" do
    it {should have_many :songs}
  end

  describe "instance method" do
    it ".average_song_play_count" do
      carly_rae = Artist.create(name: "Carly Rae")

      song_1 = Song.create(title:       "I Really Like You",
                           length:      208,
                           play_count:  2,
                          artist_id: carly_rae.id)
      song_2 = carly_rae.songs.create(title:       "Call Me Maybe",
                           length:      199,
                           play_count:  4)


      expect(carly_rae.average_song_play_count).to eq(3)

    end
  end

end
