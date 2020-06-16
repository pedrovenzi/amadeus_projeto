class User < ApplicationRecord
  authenticates_with_sorcery!
  belongs_to :role

  has_one :artist, required: false, dependent: :destroy
  has_one :listener, required: false, dependent: :destroy
end
