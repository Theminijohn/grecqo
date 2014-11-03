class AddDetailsToStatus < ActiveRecord::Migration
  def change
    add_column :statuses, :players, :boolean
    add_index :statuses, :players
    add_column :statuses, :alliances, :boolean
    add_index :statuses, :alliances
    add_column :statuses, :conquers, :boolean
    add_index :statuses, :conquers
    add_column :statuses, :towns, :boolean
    add_index :statuses, :towns
  end
end
