class Attendance < ApplicationRecord
  belongs_to :program
  validates :att_taker, :is_present, presence: true
end
