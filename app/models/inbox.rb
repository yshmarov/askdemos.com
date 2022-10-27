class Inbox < ApplicationRecord
  belongs_to :user
  has_many :messages, dependent: :destroy
  validates :title, presence: true
  validates :description, presence: true
  enum status: { draft: 'draft', active: 'active', finished: 'finished' }
end
