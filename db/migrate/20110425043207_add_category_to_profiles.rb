class AddCategoryToProfiles < ActiveRecord::Migration
  def self.up
    add_column :profiles, :category, :string
  end

  def self.down
    remove_column :profiles, :category
  end
end
