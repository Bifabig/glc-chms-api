class MemberSerializer
  include JSONAPI::Serializer
  has_many :teams

  attributes :name, :address, :phone_number, :joined_at, :photo_url


end
