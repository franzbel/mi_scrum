class Task < ActiveRecord::Base
  belongs_to :user_story
  before_save {self.title = title.upcase}
end
