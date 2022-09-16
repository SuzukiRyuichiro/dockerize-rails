class Task < ApplicationRecord
  attribute :status, default: -> { false }
end
