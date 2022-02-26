class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :id
      t.string :name
      t.text :description
      t.string :author

      t.timestamps
    end
  end
end