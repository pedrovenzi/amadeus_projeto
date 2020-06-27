class Song < ApplicationRecord
  belongs_to :album

  validates :name, presence: true
  validates :album_id, presence: true

  has_one_attached :song_file
end
