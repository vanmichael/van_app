class Spec < ActiveRecord::Base
  attr_accessible :user_id, :first_name, :last_name, :gender, :birthdate, :city, :organization

  belongs_to :user

  validates :first_name,  presence: true, length: { maximum: 50 }
  validates :last_name,  presence: true, length: { maximum: 50 }
  validates :gender,  presence: true, length: { maximum: 50 }
  validates :birthdate,  presence: true, length: { maximum: 50 }
  validates :city,  presence: true, length: { maximum: 50 }
  validates :organization,  presence: true, length: { maximum: 50 }

end
