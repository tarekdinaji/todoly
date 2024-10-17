class Task < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :due_date, presence: true

  enum :status, {
    pending: 'pending',
    processing: 'processing',
    blocked: 'blocked',
    removed: 'removed',
    completed: 'completed'
   }, default: 'pending'
end
