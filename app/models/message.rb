class Message < ApplicationRecord
  belongs_to :inbox
  belongs_to :user
  validates :body, presence: true
  enum status: { incoming: 'incoming' }
end
