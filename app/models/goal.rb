class Goal < ApplicationRecord
  belongs_to :user
  has_many :match_goals, dependent: :destroy
end
