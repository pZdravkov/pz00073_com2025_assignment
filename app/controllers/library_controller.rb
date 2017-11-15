class LibraryController < ApplicationController
  
  	def new
  		@u_lib = UserLibrary.new
  	end
  	
  	def getLibraries
  		@libraries = UserLibrary.all
  	end
  	
  	def create
  		@userID = params[:uID]
  		@songID = params[:sID]
  		@buttonID = params[:bID]
  		
  		# Check if user is logged, check if library exists, check which button is pressed and perform actions
  		if current_user == nil
  			flash[:error] = "Please sign in so you could add this song to your favourites."
  			redirect_to signin_path
  		else
  			if checkIfLibraryExists
  				checkButtonPressed(@buttonID)
  			else
  				@u_lib = UserLibrary.new
  				@u_lib.user_id = @userID
  				@u_lib.song_id = (@songID.to_i + 1).to_s
  				
  					if @u_lib.save
  						checkButtonPressed(@buttonID)
  						flash[:success] = "Song added successfully! You can now see it on your dashboard."
    					redirect_to '/library'
    				else
    					flash[:error] = "Cannot create user_library!."
  					end
  			end
  		end
  		delete
  	end
  	
  	def delete
  		getLibraries.each do |t|
  			if t.liked == false && t.liked == false && t.favorite == false
  				t.destroy
  			end
  		end
  	end
  	
  	private
  		def checkIfLibraryExists
  			UserLibrary.where(user_id: @userID, song_id: (@songID.to_i + 1).to_s).exists?
  		end
  		
  		def checkButtonPressed(btnID)
  			if btnID == 1.to_s
  				changeValueForLiked
  			else if btnID == 2.to_s
  				changeValueForDisiked
  			else if btnID == 3.to_s
  				changeValueForFavorite
  			else
  				flash[:error] = "Cannot invoke button methods!."
  			end
  			end
  			end
  		end
  		
  		def changeValueForLiked
  			if retrieveL.liked == true
  				@uLib.liked = false
  			else
  				@uLib.liked = true 
  			end
  			
  			@uLib.save
  			@uLib.reload
  		end
  		
  		def changeValueForDisliked
  			if retrieveL.disliked == true
  				@uLib.disliked = false
  			else
  				@uLib.disliked = true 
  			end
  			@uLib.save
  			@uLib.reload
  		end
  		
  		def changeValueForFavorite
  			if retrieveL.favorite == true
  				@uLib.favorite = false
  			else
  				@uLib.favorite = true
  			end
  			@uLib.save
  			@uLib.reload
  		end
  		
  		def retrieveL
  			@uLib = UserLibrary.find_by(user_id: @userID, song_id: (@songID.to_i + 1).to_s)
  		end
  	
end


