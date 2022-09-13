class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  enum role: [:customer,:admin]
  has_many :articles
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
