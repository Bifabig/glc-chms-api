class Attendance < ApplicationRecord
  belongs_to :program
  validates :name, :att_taker, :is_present, presence: true
end
