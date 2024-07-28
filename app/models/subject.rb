class Subject < ApplicationRecord
  has_many :tags
  has_many :posts, through: :tags
  validates :name, presence: true, uniqueness: true
end
