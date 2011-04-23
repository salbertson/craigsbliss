class AddUrlToListings < ActiveRecord::Migration
  def self.up
    add_column :listings, :url, :string
  end

  def self.down
    remove_column :listings, :url
  end
end
