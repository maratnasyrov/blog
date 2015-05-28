class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :text
      t.references :article, index: true
      t.references :user

      t.timestamps
    end
  end
end
