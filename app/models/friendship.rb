class Friendship < ActiveRecord::Base
	attr_accessible :friend_id, :friended_id, :friends

	belongs_to :user
end
