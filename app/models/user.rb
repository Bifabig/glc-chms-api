class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :members, foreign_key: 'user_id', dependent: :destroy
  has_many :churches, foreign_key: 'user_id', dependent: :destroy
  has_many :teams, foreign_key: 'user_id', dependent: :destroy
  has_many :programs, foreign_key: 'user_id', dependent: :destroy
  has_many :attendances, foreign_key: 'user_id', dependent: :destroy
  validates :username, :email, :password, presence: true
end
