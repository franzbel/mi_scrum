class Product < ActiveRecord::Base
  has_many :user_stories
  has_many :sprint_backlogs
end
