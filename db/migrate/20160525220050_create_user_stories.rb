class CreateUserStories < ActiveRecord::Migration
  def change
    create_table :user_stories do |t|
      t.string :title
      t.text :content

      t.timestamps null: false
    end
  end
end
