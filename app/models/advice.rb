class Advice < ApplicationRecord
  belongs_to :user
  belongs_to :moyatto

  validates :comment ,presence: true

end
