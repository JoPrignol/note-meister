class Post < ApplicationRecord
  has_many :tags, dependent: :destroy
  has_many :subjects, through: :tags
  validates :title, presence: true, uniqueness: true
  validates :content, presence: true

  accepts_nested_attributes_for :tags, allow_destroy: true
end
