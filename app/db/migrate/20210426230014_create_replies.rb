class CreateReplies < ActiveRecord::Migration[6.1]
  def change
    create_table :replies do |t|
      t.references :comment, null: false, foreign_key: true
      t.integer :upvotes
      t.integer :downvotes
      t.references :user, null: false, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
