class Member < ApplicationRecord
  has_many :teams, foreign_key: 'member_id', dependent: :destroy
  belongs_to :church
  has_many :attendances, foreign_key: 'member_id', dependent: :destroy
  has_many :programs, foreign_key: 'member_id', dependent: :destroy

  validates :name, :image, :joined_at, presence: true
end
