class TeamSerializer
  include JSONAPI::Serializer
  attributes :main_leader_name

  has_many :members
  has_many :programs
end
