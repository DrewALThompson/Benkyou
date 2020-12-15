class CreateTranslations < ActiveRecord::Migration[6.0]
  def change
    create_table :translations do |t|
      t.string :name
      t.text :content
      t.timestamps
    end
  end
end
