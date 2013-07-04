class AddBooleanColumnToPolls < ActiveRecord::Migration
  def change
    add_column :polls, :restricted, :boolean, :default => false
  end
end
