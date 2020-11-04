class Sukkiri < ApplicationRecord

  belongs_to :user
  belongs_to :moyatto
  belongs_to :guess

end
