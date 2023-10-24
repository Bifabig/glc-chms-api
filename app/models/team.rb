class Team < ApplicationRecord
  has_many :members, foreign_key: 'team_id', dependent: :destroy
  has_many :programs, foreign_key: 'team_id', dependent: :destroy
  belongs_to :church
  has_many :attendances, foreign_key: 'team_id', dependent: :destroy
  validates :name, :main_leader_name, :sub_leader_name, presence: true
end
