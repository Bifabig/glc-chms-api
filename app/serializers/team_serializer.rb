class TeamSerializer
  include JSONAPI::Serializer
  attributes :name, :main_leader_name, :sub_leader_name, :established_at, :members

end
