require 'rails_helper'

describe Song, type: :model do
  #validations
  describe "validations" do
    it { should validate_presence_of :title}
    it { should validate_presence_of :play_count}
    it { should validate_presence_of :length}
  end

  #relationships
  describe "relationships" do
    it {should belong_to :artist}
    it {should have_many :playlist_songs}
    it {should have_many(:playlists).through(:playlist_songs)}
  end

  describe "class methods" do
    it ".average_play_count" do
      carly_rae = Artist.create(name: "Carly Rae")
      brittney_spears = Artist.create(name: "Brittney Spears")

      song_1 = Song.create(title:       "I Really Like You",
                           length:      208,
                           play_count:  2,
                          artist_id: carly_rae.id)
      song_2 = carly_rae.songs.create(title:       "Call Me Maybe",
                           length:      199,
                           play_count:  4)

      brittney_spears.songs << Song.create(title:       "Crazy",
                           length:      399,
                           play_count:  6)

      carly_rae_songs = [song_1,song_2]

      expect(Song.average_play_count).to eq(4)
    end
  end
end
