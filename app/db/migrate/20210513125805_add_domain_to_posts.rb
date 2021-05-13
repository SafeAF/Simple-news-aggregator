class AddDomainToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :domain, :string
  end
end
