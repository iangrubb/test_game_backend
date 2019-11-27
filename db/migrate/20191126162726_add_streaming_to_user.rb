class AddStreamingToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :logged, :boolean, default: false
  end
end
