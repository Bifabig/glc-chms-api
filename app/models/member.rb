class Member < ApplicationRecord
  belongs_to :church
  has_and_belongs_to_many :teams, foreign_key: 'team_id', dependent: :destroy

  validates :name, :photo, :address, :phone_number, :joined_at, presence: true
end
