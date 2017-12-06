class CreateCrawlings < ActiveRecord::Migration
  def change
    create_table :crawlings do |t|
      t.text :url
      t.text :result

      t.timestamps null: false
    end
  end
end
