class Game < ActiveRecord::Base
  attr_accessible :description, :name, :date, :icon_id, :pool_id, :game_id
  belongs_to :user
  has_many :users, :through => :pools
  has_many :pools 
  has_many :icons

  validates :user_id, presence: true
  validates :name, presence: true
  validates :description, presence: true, length: { maximum: 50 }


  default_scope order: 'games.created_at DESC'
end
