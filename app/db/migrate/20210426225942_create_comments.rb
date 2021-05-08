class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :post, null: false, foreign_key: true
      t.integer :upvotes, default: 0
      t.integer :downvotes, default: 0
      t.references :user, null: false, foreign_key: true
      t.text :body

      t.integer :cached_votes_total, default: 0
      t.integer :cached_votes_score, default: 0
      t.integer :cached_votes_up, default: 0
      t.integer :cached_votes_down, default: 0
      t.integer :cached_weighted_score, default: 0
      t.integer :cached_weighted_total, default: 0
      t.float :cached_weighted_average, default: 0.0
      
      t.timestamps
    end
  end
end
