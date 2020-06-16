class Album < ApplicationRecord
  belongs_to :artist

  validates :name, length:{minimum: 2}, presence: true
  validates :artist, presence: true

  has_many :songs, dependent: :destroy
end
