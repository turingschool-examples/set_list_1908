class Artist < ApplicationRecord
  validates_presence_of :name
  has_many :songs

  def average_song_play_count
    songs.average(:play_count)
  end
end
