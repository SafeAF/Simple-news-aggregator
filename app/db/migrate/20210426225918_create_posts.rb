class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :url
      t.integer :upvotes, default: 0
      t.integer :total_comments, default: 0
      t.string :headline
      t.text :body
      t.boolean :argument

      t.timestamps
    end
  end
end
