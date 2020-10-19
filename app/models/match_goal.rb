class MatchGoal < ApplicationRecord
  belongs_to :team
  belongs_to :goal
  belongs_to :assist
  belongs_to :match
end
