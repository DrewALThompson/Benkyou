class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :content
      t.string :translation_title
      t.text :translation
      t.belongs_to :user
      t.timestamps
    end
  end
end
