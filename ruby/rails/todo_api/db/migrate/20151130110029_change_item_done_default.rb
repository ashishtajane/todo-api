class ChangeItemDoneDefault < ActiveRecord::Migration
  def change
    change_column_default :items, :done, false
  end
end
