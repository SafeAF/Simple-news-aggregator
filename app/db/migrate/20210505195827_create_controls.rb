class CreateControls < ActiveRecord::Migration[6.1]
  def change
    create_table :controls do |t|
    	t.boolean :registrations_enabled, default: true
    	t.boolean :post_decay_on, default: true
    	t.integer :post_decay, default: 3600
      t.timestamps
    end
  end
end
