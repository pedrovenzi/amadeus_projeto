class Song < ApplicationRecord
  belongs_to :album

  validates :name, presence: true
  validates :album_id, presence: true

end
