class AttendanceSerializer
  include JSONAPI::Serializer
  belongs_to :program

  attributes :id, :member_name, :status, :remark, :created_at, :updated_at
end
