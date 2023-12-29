class Program < ApplicationRecord
  belongs_to :church
  has_and_belongs_to_many :teams, foreign_key: 'program_id', dependent: :destroy
  has_many :attendances, foreign_key: 'program_id', dependent: :destroy
 
  validates :name, :date, :attendance_taker, presence: true
end
