class Saying < ApplicationRecord
  belongs_to :category
  belongs_to :user
    
  enum saying_type: { official: 0, original: 1 }
  enum status: { draft: 0, pending: 1, approved: 2, rejected: 3, published: 4 }
  
  validates :content, presence: true, length: { maximum: 1000 }
  validates :author_name, presence: true, length: { maximum: 100 }
  validates :saying_type, presence: true
  validates :status, presence: true
  
end
