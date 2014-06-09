class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
    		t.string :name, :description
    		t.integer :creator_id
    		t.float :cost

      t.timestamps
    end
  end
end