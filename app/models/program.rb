class Program < ApplicationRecord
  belongs_to :church
  has_and_belongs_to_many :teams, foreign_key: 'program_id', dependent: :destroy
  # has_one :attendance, dependent: :destroy

  validates :name, :date, presence: true
end
