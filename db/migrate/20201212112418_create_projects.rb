class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :content
      t.belongs_to :user
      t.belongs_to :translation
      t.timestamps
    end
  end
end
