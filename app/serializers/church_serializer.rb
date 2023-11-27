class ChurchSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :established_at, :location
end
