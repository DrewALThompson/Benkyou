class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :content
      t.belongs_to :project
      t.belongs_to :user
      t.timestamps
    end
  end
end
