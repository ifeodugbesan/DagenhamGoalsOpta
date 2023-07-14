class Goal < ApplicationRecord
  belongs_to :player
  has_many :match_goals, dependent: :destroy
end
