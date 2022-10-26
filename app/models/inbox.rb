class Inbox < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :description, presence: true
  enum status: { draft: 'draft', active: 'active', finished: 'finished' }
end
