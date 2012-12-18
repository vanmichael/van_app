class Feedback < ActiveRecord::Base
   attr_accessible :content, :user_id
   belongs_to :user

   validates :user_id, presence: true
   validates :content, presence: true, length: { maximum: 500 }
end



