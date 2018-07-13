class ChangeDuedateTypeToTodos < ActiveRecord::Migration[5.1]
  def change
    change_column :todos, :due_date, :datetime
  end
end
