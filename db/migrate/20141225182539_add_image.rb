class AddImage < ActiveRecord::Migration
  def self.up
    add_attachment :articles, :image
  end

  def self.down
    remove_attachment :articles, :image
  end
end
