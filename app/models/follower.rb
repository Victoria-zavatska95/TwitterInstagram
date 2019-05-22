class Follower < ApplicationRecord
	belongs_to :user
	validates :initial_user_id, presence: true
end
