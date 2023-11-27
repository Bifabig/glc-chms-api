class Attendance < ApplicationRecord
  belongs_to :program
  validates :att_taker, presence: true
end
