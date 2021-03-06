class LibraryController < ApplicationController
  
  	# Method initializing a new UserLibrary object.
  	def new
  		@u_lib = UserLibrary.new
  	end
  	
  	# Method that returns all UserLibrary objects.
  	def getLibraries
  		@libraries = UserLibrary.all
  	end
  	
  	def create
  	
  		$userID
  		$songID
  		$buttonID
  		$comment
  	
		checkUser
		setParams	
  		checkButton
  		clearGarbage
  		redirect_to '/library'
  	end
  	
  	private
  	
  		def clearGarbage
  			getLibraries.each do |t|
  				if t.liked == false && t.disliked == false && t.favorite == false
  					t.destroy
  				end
  			end
  		end
  	
  		def checkUser
  			if current_user == nil
  				flash[:error] = "Please sign in so you can add this song to your favorites."
  				redirect_to signin_path
  			end
  		end
  	
  		def setParams
  			if params['local'] != nil
  				$userID = params['local']['uID']
  				$songID = params['local']['sID']
  				$buttonID = params['local']['bID']
  			else if params['remote'] != nil
  				$userID = params['remote']['uID']
  				$songID = params['remote']['sID']
  				$buttonID = params['remote']['bID']
  				$comment = params['remote']['content']
  			else
  				flash[:error] = "Opps! Cannot find any button provided params!"
  				redirect_to '/library'
  			end
  			end
  		end
  	
  		def checkButton
  			if $buttonID == 1.to_s
  				selectedLikeBtn
  			else if $buttonID == 2.to_s
  				selectedDislikeBtn
  			else if $buttonID == 3.to_s
  				selectedFavoriteBtn
  			else if $buttonID == 4.to_s
  				selectedCommentBtn
  			end
  			end
  			end
  			end
  		end
  	
  		def selectedLikeBtn
  			prepareLibrary
  			updateColumn("liked")
  		end
  	
 	 	def selectedDislikeBtn
  			prepareLibrary
  			updateColumn("disliked")
 	 	end
  	
  		def selectedFavoriteBtn
  			prepareLibrary
  			updateColumn("favorite")
 	 	end
 	 	
 	 	def selectedCommentBtn
 	 		addComment
 	 	end
 	 	
 	 	def prepareLibrary
 	 		if UserLibrary.where(user_id: $userID, song_id: ($songID.to_i + 1).to_s).exists? == false
 	 			@uLib = UserLibrary.new
 	 			@uLib.user_id = $userID
 	 			@uLib.song_id = ($songID.to_i + 1).to_s
 	 			@uLib.save
 	 			@uLib.reload
 	 		end
 	 	end
 	 	
 	 	def addComment
 	 		@record = Comment.new
 	 		@record.user_id = $userID
 	 		@record.song_id = ($songID.to_i + 1).to_s
 	 		@record.comment = $comment
 	 		if @record.save
 	 			flash[:success] = "Comment added"
 	 		end
 	 	end
 	 	
 	 	def updateColumn(column)
 	 		@current = UserLibrary.find_by(user_id: $userID, song_id: ($songID.to_i + 1).to_s)	 		
 	 		
 	 		if column == "liked"
 	 			if @current.liked == false
 	 				if @current.disliked == true
 	 					@current.disliked = false
 	 					@current.liked = true
 	 				else
 	 					@current.liked = true
 	 				end
 	 				flashMessage("liked", true)
 	 			else
 	 				@current.liked = false
 	 				flashMessage("liked", false)
 	 			end
 	 		end
 	 		
 	 		if column == "disliked"
 	 			if @current.disliked == false
 	 				if @current.liked == true
 	 					@current.liked = false
 	 					@current.disliked = true
 	 				else
 	 					@current.disliked = true
 	 				end
 	 				flashMessage("disliked", true)
 	 			else
 	 				@current.disliked = false
 	 				flashMessage("disliked", false)
 	 			end
 	 		end
 	 		
 	 		if column == "favorite"
 	 			if @current.favorite == true
 	 				@current.favorite = false
 	 				flashMessage("favorite", false)
 	 			else
 	 				@current.favorite = true
 	 				flashMessage("favorite", true)
 	 			end
 	 		end
 	 		
 	 		@current.save
 	 		@current.reload
 	 	end
 	 	
 	 	def flashMessage(column, value)
 	 		
 	 		out = ""
 	 		
 	 		if column == "liked"
 	 			if value == true
 	 				out = "Song Liked!"
 	 			else
 	 				out = "Like removed!"
 	 			end
 	 		else if column == "disliked"
 	 			if value == true
 	 				out = "Disliked!"
 	 			else
 	 				out = "Dislike Removed!"
 	 			end
 	 		else if column == "favorite"
 	 			if value == true
 	 				out = "Added to favorites!"
 	 			else
 	 				out = "Removed from favorites!"
 	 			end
 	 		end
 	 		end
 	 		end
 	 		
 	 		flash[:success] = out
 	 	end
end

