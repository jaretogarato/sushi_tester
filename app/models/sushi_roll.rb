class SushiRoll < ApplicationRecord
  belongs_to :user, optional: true
end
