class CreateAcceptances < ActiveRecord::Migration
  def change
    create_table :acceptances do |t|
      t.text :criterion
      t.references :user_story, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
