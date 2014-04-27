class AddParentsBestChildFk < ActiveRecord::Migration
  def change
    add_foreign_key :parents, :children, column: :best_child_id
  end
end
