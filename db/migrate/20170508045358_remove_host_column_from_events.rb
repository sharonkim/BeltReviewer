class RemoveHostColumnFromEvents < ActiveRecord::Migration[5.0]
  def change
      remove_column :events, :host, :string
  end
end
