class AddImageForUser < ActiveRecord::Migration
  def self.up
    add_attachment :users, :image_profile
  end

  def self.down
    remove_attachment :users, :image_profile
  end
end
