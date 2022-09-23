class Article < ApplicationRecord
    has_many :comments, dependent: :destroy
    validates :title, presence: true, length: { minimum: 5 }
    has_one_attached :avatar, dependent: :destroy
    belongs_to :user
    has_many :article_categories
    has_many :categories ,through: :article_categories ,dependent: :destroy 
end