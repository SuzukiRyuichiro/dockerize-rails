class ChangeColumnNameToDescription < ActiveRecord::Migration[7.0]
  def change
    rename_column :tasks, :discription, :description
  end
end
