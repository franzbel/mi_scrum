class AddReferencesToUserStories < ActiveRecord::Migration
  def change
    add_reference :user_stories, :sprint_backlog, index: true, foreign_key: true, default: ''
  end
end
