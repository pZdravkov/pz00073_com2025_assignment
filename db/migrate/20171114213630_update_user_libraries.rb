class UpdateUserLibraries < ActiveRecord::Migration[5.0]
  def change
  		remove_column :user_libraries, :userID
  		remove_column :user_libraries, :songID
  		
  		add_reference :user_libraries, :user, index: true
      add_foreign_key :user_libraries, :users
      
      add_reference :user_libraries, :song, index: true
      add_foreign_key :user_libraries, :songs
  end
end
