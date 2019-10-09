class Song < ApplicationRecord
  validates_presence_of :title, :play_count, :length
  has_many :playlist_songs
  has_many :playlists, through: :playlist_songs
  belongs_to :artist

  def self.average_play_count
    average(:play_count)
  end

end
