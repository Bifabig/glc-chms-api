class ProgramSerializer
  include JSONAPI::Serializer
  belongs_to :church
  has_many :teams
  has_many :attendances

  attributes :id, :name, :date, :attendance_taker
end
