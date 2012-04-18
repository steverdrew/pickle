class CreateProperties < ActiveRecord::Migration
  def self.up
    create_table :properties do |t|
      t.integer :user_id
      t.string :name,            :default => nil
      t.string :tagline,          :default => nil
      t.timestamps
    end
  end
 
  def self.down
    drop_table :properties
  end
  
end
