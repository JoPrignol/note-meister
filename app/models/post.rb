class Post < ApplicationRecord
  has_many :tags
  has_many :subjects, through: :tags
  validates :title, presence: true, uniqueness: true
  validates :body, presence: true
end
