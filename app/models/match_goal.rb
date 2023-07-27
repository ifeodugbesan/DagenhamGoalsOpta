class MatchGoal < ApplicationRecord
  belongs_to :team
  belongs_to :goal, dependent: :destroy
  belongs_to :assist, optional: true, dependent: :destroy
  belongs_to :match
end
