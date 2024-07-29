class Subject < ApplicationRecord
  has_many :tags, dependent: :destroy
  has_many :posts, through: :tags
  validates :name, presence: true, uniqueness: true
end
