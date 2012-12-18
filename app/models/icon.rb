class Icon < ActiveRecord::Base
  attr_accessible :image, :sport_type, :user_id, :name
  belongs_to :game
  belongs_to :user

  require 'carrierwave/orm/activerecord'
  mount_uploader :image, IconUploader

  default_scope order: 'icons.created_at DESC'
end
