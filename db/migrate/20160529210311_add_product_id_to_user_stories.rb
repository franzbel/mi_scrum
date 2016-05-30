class AddProductIdToUserStories < ActiveRecord::Migration
  def change
    add_reference :user_stories, :product, index: true, foreign_key: true
  end
end
