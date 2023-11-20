class MemberSerializer
  include JSONAPI::Serializer
  belongs_to :church
  has_many :teams, &:teams

  attributes :id, :name, :address, :phone_number, :joined_at, :photo_url
end
