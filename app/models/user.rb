class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable,
         :jwt_authenticatable, jwt_revocation_strategy: self
  # devise :database_authenticatable, :registerable,
  #       :validatable, :jwt_authenticatable, jwt_revocation_strategy: self

  # has_many :churches, foreign_key: 'user_id', dependent: :destroy
  # validates :email, :password, presence: true
end
