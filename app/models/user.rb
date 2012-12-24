class User < ActiveRecord::Base
  attr_accessible :screen_name, :first_name, :last_name, :email, :password, :password_confirmation, :image, :credit
  has_secure_password

  has_one :spec
  has_many :microposts, dependent: :destroy
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: "followed_id", 
                                   class_name: "Relationship",
                                   dependent: :destroy
  has_many :followers, through: :reverse_relationships, source: :follower
  has_many :feedbacks
  has_many :games
  has_many :icons
  has_many :pools
  has_many :players

  has_many :friendships
  
  has_many :friends, :through => :friendships, :conditions => "status = 'accepted'"
  has_many :requested_friends, :through => :friendships, :source => :friend, :conditions => "status = 'requested'"
  has_many :pending_friends, :through => :friendships, :source => :friend, :conditions => "status = 'pending'"

  require 'carrierwave/orm/activerecord'
  mount_uploader :image, ImageUploader

  before_save { |user| user.email = user.email.downcase }
  before_save :create_remember_token

  after_save { |user| generate_screen_name(user) }

  validates :first_name,  presence: true, length: { maximum: 50 }
  validates :last_name,  presence: true, length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
  					uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  def generate_screen_name(user)
    if user.screen_name.nil?
       user.screen_name = (user.first_name + "_" + user.last_name + "_" + user.id.to_s).downcase
       user.save
    end
  end

  def following?(other_user)
    relationships.find_by_followed_id(other_user.id)
  end     

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by_followed_id(other_user.id).destroy
  end

  def feed
    Micropost.from_users_followed_by(self)
  end

  private

  def create_remember_token
  	 self.remember_token = SecureRandom.urlsafe_base64
  end
end