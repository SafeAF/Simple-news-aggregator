class CreateReplies < ActiveRecord::Migration[6.1]
  def change
    create_table :replies do |t|
      t.references :comment, null: false, foreign_key: true
      t.integer :upvotes, default: 0
      t.integer :downvotes, default: 0
      t.references :user, null: false, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
