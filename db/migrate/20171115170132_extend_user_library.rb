class ExtendUserLibrary < ActiveRecord::Migration[5.0]
  def change
  	add_column :user_libraries, :liked, :boolean, default: false
  	add_column :user_libraries, :disliked, :boolean, default: false
	add_column :user_libraries, :favorite, :boolean, default: false
  end
end
