class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
    	t.string :name, :description
    	t.date :happen_at
    	t.integer :creator_id
    	
      t.timestamps
    end
  end
end
