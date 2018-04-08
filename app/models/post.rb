class Post < ApplicationRecord
  has_many :comments
  belongs_to :user

  scope :published, -> { where.not(published_at: :nil) }
  scope :draft, -> { where(published_at: :nil) }
end
