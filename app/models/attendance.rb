class Attendance < ApplicationRecord
  belongs_to :program
  validates :member_name, :status, :remark, presence: true
end
