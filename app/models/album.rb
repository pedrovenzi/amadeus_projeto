class Album < ApplicationRecord
  
  validates :name, length:{minimum: 2}, presence: true
  validates :artist, presence: true

  belongs_to :artist
  has_many :songs, dependent: :destroy
  has_one_attached :photo

  def self.search(search)
    if search
      catapimbas = User.where(name: search).first
      artista = Artist.where(user_id: catapimbas.id)
      if artista
        self.where(artist_id: artista)
      else
        Album.all
      end
    else
      Album.all
    end
  end
end
