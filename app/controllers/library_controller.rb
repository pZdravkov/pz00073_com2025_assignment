class LibraryController < ApplicationController
  
  def new
    @u_lib = UserLibrary.new
  end
  
  def create
  
    @song = params[:id]
    
    @u_lib = UserLibrary.new
    @u_lib.user_id = current_user.id
	 @u_lib.song_id = @song
    
    if @u_lib.save
    	flash[:success] = "Song added successfully! You can now see it on your dashboard."
    	render 'show'
    else
      flash[:error] = "Oooops! Something went wrong!."
      render 'show'
    end
  end
  
  def delete
  end

end
