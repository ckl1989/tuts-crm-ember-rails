class Task < ApplicationRecord
  enum status: [:active, :completed]

  belongs_to :project
  belongs_to :offer
end
