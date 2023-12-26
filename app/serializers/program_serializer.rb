class ProgramSerializer
  include JSONAPI::Serializer
  belongs_to :church
  has_many :teams

  attributes :id, :name, :date
end
