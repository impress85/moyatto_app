class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :moyattos
  has_many :guesses
  has_many :sukkiris
  has_many :advices

  with_options presence: true do
    validates :nickname
    validates :password, length: { minimum: 6 },
              format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i } 
  end

end
