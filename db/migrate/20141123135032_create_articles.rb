class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title, null: false, default: ""
      t.string :text, null: false, default: ""
      t.references :user

      t.timestamps
    end
  end
end
