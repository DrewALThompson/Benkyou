class CreateTranslations < ActiveRecord::Migration[6.0]
  def change
    create_table :translations do |t|
      t.string :name
      t.content :text
      t.belongs_to :user
      t.belongs_to :project
      t.timestamps
    end
  end
end
