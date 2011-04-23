class AddProfileIdToListings < ActiveRecord::Migration
  def self.up
    add_column :listings, :profile_id, :integer
  end

  def self.down
    add_column :listings, :profile_id
  end
end
