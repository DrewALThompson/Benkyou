class AddUidColumnToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :uid, :integer
  end
end
