class CreateParents < ActiveRecord::Migration
  def change
    create_table :parents do |t|
      t.string :name
      t.integer :best_child_id

      t.timestamps
    end
  end
end
