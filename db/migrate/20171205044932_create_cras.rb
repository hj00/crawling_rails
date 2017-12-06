class CreateCras < ActiveRecord::Migration
  def change
    create_table :cras do |t|
      t.text :urlad
      t.text :words

      t.timestamps null: false
    end
  end
end
