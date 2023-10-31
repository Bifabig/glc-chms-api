class Team < ApplicationRecord
  has_and_belongs_to_many :members, foreign_key: 'team_id', dependent: :destroy
  has_and_belongs_to_many :programs, foreign_key: 'team_id', dependent: :destroy
  belongs_to :church

  validates :name, :main_leader_name, :sub_leader_name, presence: true
end
