class AddPrivacyToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :privacy, :boolean
  end
end
