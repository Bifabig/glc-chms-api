class TeamSerializer
  include JSONAPI::Serializer
  attributes :name, :main_leader_name, :sub_leader_name, :established_at

  has_many :members
end
