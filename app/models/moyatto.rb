class Moyatto < ApplicationRecord

  belongs_to :user
  has_one_attached :image
  has_many :guesses
  has_many :sukkiris

end
