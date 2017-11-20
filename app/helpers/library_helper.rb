# library_helper.rb
# Written by Petar Zdravkov pz00073

module LibraryHelper
	
	# Method returning all songs into an array.
	def getSongs
	  @songs = Song.all
	end
	
	# Method returning all user_libraries into an array.
	def getLibraries
	  @libraries = UserLibrary.all
	end
	
	# Method returning embed url for a specific song.
   def getUrl(song)
	   "https://www.youtube.com/embed/" +  song.url + "?showinfo=0;rel=0;controls=0"
	end
	
	# Method returning thumbnail image for a specific song.
	def getThumbnail(song)
		"https://img.youtube.com/vi/" + song.url + "/0.jpg"
	end
	
	# Method updating the carousel selector when clicked on an thumbnail item.
	def updateSelectorId(index)
		"carousel-selector-" + index.to_s
	end
	
	# Method that checks if a song is liked, disliked or added in favourites and changes the
	# color of the button as marked.	
	def checkifSelected(currentIndex, buttonID)
		out = ""
		
		if buttonID == 1
			getLibraries.each do |t|
				if t.user_id == current_user.id && t.song_id == currentIndex + 1 && t.liked == true
					out = "color: #00BF9A"
				end
			end
		end
		
		if buttonID == 2
			getLibraries.each do |t|
				if t.user_id == current_user.id && t.song_id == currentIndex + 1 && t.disliked == true
					out = "color: #00BF9A"
				end
			end
		end
		
		if buttonID == 3
			getLibraries.each do |t|
				if t.user_id == current_user.id && t.song_id == currentIndex + 1 && t.favorite == true
					out = "color: gold"
				end
			end
		end
		out
	end
	
	# Method that checks if a song is liked, disliked or added in favourites and changes the
	# color of the button as marked.	
	def checkSelectedCount(currentIndex, buttonID)
		out = 0
		
		if buttonID == 1
			getLibraries.each do |t|
				if t.song_id == currentIndex + 1 && t.liked == true
					out += 1
				end
			end
		end
		
		if buttonID == 2
			getLibraries.each do |t|
				if t.song_id == currentIndex + 1 && t.disliked == true
					out += 1
				end
			end
		end
		
		if buttonID == 3
			getLibraries.each do |t|
				if t.song_id == currentIndex + 1 && t.favorite == true
					out += 1
				end
			end
		end
		
		out
	end
	
end
