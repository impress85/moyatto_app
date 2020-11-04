class Moyatto < ApplicationRecord

  belongs_to :user
  has_one_attached :image
  has_many :guesses ,dependent: :destroy
  has_many :sukkiris ,dependent: :destroy
  has_many :advices ,dependent: :destroy

end
