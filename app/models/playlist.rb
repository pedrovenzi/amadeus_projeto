class Playlist < ApplicationRecord

  validates :name, length:{minimum: 2}, presence: true
  validates :listener, presence: true

  belongs_to :listener
  has_many :song_playlists, dependent: :destroy
  has_many :songs, through: :song_playlists
end
