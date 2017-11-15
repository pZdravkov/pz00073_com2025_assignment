class CreateUserLibraries < ActiveRecord::Migration[5.0]
  def change
    create_table :user_libraries do |t|
		t.integer :userID
		t.integer :songID		
		
      t.timestamps
    end
  end
end
