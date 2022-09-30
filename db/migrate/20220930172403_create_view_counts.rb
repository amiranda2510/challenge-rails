class CreateViewCounts < ActiveRecord::Migration[7.0]
  def change
    create_table :view_counts do |t|
      t.string :path, null: false
      t.integer :views, null: false, default: 0
      t.timestamps
    end
  end
end
