class MemberSerializer
  include JSONAPI::Serializer
  attributes :name, :address, :phone_number, :joined_at, :photo_url

  has_many :teams, serializer: TeamSerializer

end
