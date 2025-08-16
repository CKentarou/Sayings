class Category < ApplicationRecord
  has_many :sayings, dependent: :restrict_with_error
  
  validates :name, presence: true, uniqueness: true, length: { maximum: 50 }
  
  scope :ordered, -> { order(:name) }
  
end
