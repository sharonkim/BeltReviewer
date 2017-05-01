class ChangeColumnOrder < ActiveRecord::Migration[5.0]
  def up
      change_column :users, :first_name, :string, first: true
      change_column :users, :last_name, :string, after: :first_name
  end
end
