class Guess < ApplicationRecord

  belongs_to :user
  belongs_to :moyatto
  has_one :sukkiri ,dependent: :destroy

end
