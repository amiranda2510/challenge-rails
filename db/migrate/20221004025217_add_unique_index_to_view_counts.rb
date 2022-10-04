class AddUniqueIndexToViewCounts < ActiveRecord::Migration[7.0]
  def change
    add_index :view_counts, :views, unique: true
  end
end
