class Program < ApplicationRecord
  has_many :attendances, foreign_key: 'program_id', dependent: :destroy
  belongs_to :church
  has_many :teams, foreign_key: 'program_id', dependent: :destroy
  has_many :members, foreign_key: 'program_id', dependent: :destroy
  validates :name, :date, presence: true
end
