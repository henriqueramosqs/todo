class Task < ApplicationRecord
  belongs_to :list
  validates :description, presence: true
  scope :todos, -> { where(done: false) }
  scope :completed, -> { where(done: true) }
end
