class Userparam < ApplicationRecord
  belongs_to :user
  mount_uploader :avatar, AvatarUploader
  validates :nick_name, presence: true
end
