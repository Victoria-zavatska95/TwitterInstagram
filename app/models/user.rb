class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :followers
  has_many :followings
  has_many :tweets, dependent: :destroy
  has_many :mems, dependent: :destroy
  has_many :messages
end
