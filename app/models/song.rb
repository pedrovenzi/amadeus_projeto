class Song < ApplicationRecord
  belongs_to :album

  validates :name, presence: true
  validates :album_id, presence: true

  has_one_attached :file
  has_many :favorite_songs, dependent: :destroy
  has_many :song_playlists, dependent: :destroy
  has_many :playlists, through: :song_playlists

  def self.search(search)
    if search
      catapimbas = Album.where(name: search).first
      album = Album.find_by(name: search)
      if album
        self.where(album_id: album.id)
      else
        Song.all
      end
    else
      Song.all
    end
  end
end