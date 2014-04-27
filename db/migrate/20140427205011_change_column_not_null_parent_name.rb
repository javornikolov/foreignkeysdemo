class ChangeColumnNotNullParentName < ActiveRecord::Migration
  def change
    change_column_null :parents, :name, false
  end
end
