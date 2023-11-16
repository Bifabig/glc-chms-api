class Member < ApplicationRecord
  belongs_to :church
  has_one_attached :photo
  has_and_belongs_to_many :teams, foreign_key: 'member_id', dependent: :destroy

  validates :name, :photo, :address, :phone_number, :joined_at, presence: true

  def photo_url
    Rails.application.routes.url_helpers.url_for(photo) if photo.attached?
  end
end
