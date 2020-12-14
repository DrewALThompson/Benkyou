class CreateWords < ActiveRecord::Migration[6.0]
  def change
    create_table :words do |t|
      t.string :character
      t.string :name
      t.text :definition
      t.belongs_to :user
      t.timestamps
    end
  end
end
