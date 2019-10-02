class Song < ApplicationRecord
  validates_presence_of :title, :play_count, :length
  belongs_to :artist

  def self.average_play_count
    average(:play_count)
  end

end
