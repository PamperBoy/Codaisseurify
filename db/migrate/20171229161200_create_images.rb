class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.references :artist, foreign_key: true
      t.string :source

      t.timestamps
    end
  end
end
