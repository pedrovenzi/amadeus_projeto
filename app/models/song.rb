class Song < ApplicationRecord
  belongs_to :album

  validates :name, presence: true
  validates :album_id, presence: true

  has_one_attached :file
  has_many :song_playlists, dependent: :destroy
  has_many :playlists, through: :song_playlists
end
