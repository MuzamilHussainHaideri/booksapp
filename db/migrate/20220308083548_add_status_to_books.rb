class AddStatusToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :is_published, :boolean, default: false
  end
end
