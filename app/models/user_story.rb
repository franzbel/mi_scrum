class UserStory < ActiveRecord::Base
  has_many :acceptances, dependent: :destroy
  has_many :tasks
  belongs_to :product
  accepts_nested_attributes_for :acceptances, reject_if: lambda {|attributes| attributes['criterion'].blank?}
  belongs_to :sprint_backlog
  before_save {self.title = title.upcase}


  def self.update_sprint_backlog_id(params, sprint_backlog_id)
    UserStory.where('sprint_backlog_id = ? OR sprint_backlog_id IS ?', sprint_backlog_id, nil).each do |user_story|
      if params.has_key?(user_story.id.to_s)
        user_story.update_attribute(:sprint_backlog_id, sprint_backlog_id)
      else
        user_story.update_attribute(:sprint_backlog_id, '')
      end
    end
  end

  def self.create_sprint_backlog_id(params, sprint_backlog_id)
      UserStory.all.each do |user_story|
      if params.has_key?(user_story.id.to_s)
        user_story.update_attribute(:sprint_backlog_id, sprint_backlog_id)
      end
    end
  end
end



    