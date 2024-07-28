class Tag < ApplicationRecord
  belongs_to :post
  belongs_to :subject
  validates :post_id, presence: true
  validates :subject_id, presence: true
end
