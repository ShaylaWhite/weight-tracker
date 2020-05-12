class CreateStats < ActiveRecord::Migration
  def change 
    create_table :stats do |t| 
      t.integer :weight
      t.integer :user_id
    end 
  end 
end 
