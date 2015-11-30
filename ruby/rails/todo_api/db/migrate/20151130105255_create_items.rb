class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :text
      t.boolean :done

      t.timestamps null: false
    end
  end
end
