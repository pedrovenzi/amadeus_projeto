class Album < ApplicationRecord
  
  validates :name, length:{minimum: 2}, presence: true
  validates :artist, presence: true

  belongs_to :artist
  has_many :songs, dependent: :destroy
  has_one_attached :photo
end
