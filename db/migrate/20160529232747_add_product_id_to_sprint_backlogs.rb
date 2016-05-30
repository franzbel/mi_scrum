class AddProductIdToSprintBacklogs < ActiveRecord::Migration
  def change
    add_reference :sprint_backlogs, :product, index: true, foreign_key: true
  end
end
