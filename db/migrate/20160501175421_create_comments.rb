class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :title
      t.text :body
      t.belongs_to :user, index: true
      t.belongs_to :article, index: true
      t.timestamps null: false
    end
  end
end
