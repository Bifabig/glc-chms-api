class Church < ApplicationRecord
  has_many :teams, foreign_key: 'church_id', dependent: :destroy
  has_many :members, foreign_key: 'church_id', dependent: :destroy
  has_many :programs, foreign_key: 'church_id', dependent: :destroy
  belongs_to :user
  validates :name, :established_at, :location, presence: true
end
