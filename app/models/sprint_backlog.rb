class SprintBacklog < ActiveRecord::Base
  has_many :user_stories, dependent: :nullify
  belongs_to :product
  before_save {self.title = title.upcase}
end
