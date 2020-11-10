class Sukkiri < ApplicationRecord

  belongs_to :user
  belongs_to :moyatto
  belongs_to :guess

  with_options presence: true do
    validates :result
    validates :moyatto_status
  end

end
