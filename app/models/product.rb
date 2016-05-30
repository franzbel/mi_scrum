class Product < ActiveRecord::Base
  has_many :user_stories, dependent: :destroy
  has_many :sprint_backlogs, dependent: :destroy
end
