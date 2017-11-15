module LibraryHelper

	def getSongs
	  @songs = Song.all
	end
	
	def getLibraries
	  @libraries = UserLibrary.all
	end

   def getUrl(song)
	   "https://www.youtube.com/embed/" +  song.url + "?showinfo=0;rel=0;controls=0"
	end
	
	def getThumbnail(song)
		"https://img.youtube.com/vi/" + song.url + "/0.jpg"
	end
	
	def updateSelectorId(index)
		"carousel-selector-" + index.to_s
	end
	
	def countLikes(currentIndex)

		counter = 0		
		
		getLibraries.each do |t|
			
			if t.song_id + 1 == currentIndex && t.liked == true
				counter += 1
			end
		end
		
		counter
	end
	
	def countDislikes(currentIndex)

		counter = 0		
		
		getLibraries.each do |t|
			
			if t.song_id + 1 == currentIndex && t.disliked == true
				counter += 1
			end
		end
		
		counter
	end
	
	def countInFav(currentIndex)

		counter = 0		
		
		getLibraries.each do |t|
			
			if t.song_id + 1 == currentIndex
				counter += 1
			end
		end
		
		counter
	end
	
	def checkIfLiked(currentIndex)
	
		out = ""
	
		song = nil
		
		getLibraries.each do |t|
			if current_user.id == t.user_id && currentIndex + 1 == t.song_id
				song = t
			end
		end
		
		if song == nil
			out = "color: white"
		else if song.liked == true
			out = "color: red"
		else
			out = "color: white"
		end
		end
		out
	end
	
	def checkIfDisiked(currentIndex)
	
		out = ""
	
		song = nil
		
		getLibraries.each do |t|
			if current_user.id == t.user_id && currentIndex + 1 == t.song_id
				song = t
			end
		end
		
		if song == nil
			out = "color: white"
		else if song.disliked == true
			out = "color: red"
		else
			out = "color: white"
		end
		end
		out
	end
	
	def checkIfFav(currentIndex)
	
		out = ""
	
		song = nil
		
		getLibraries.each do |t|
			if current_user.id == t.user_id && currentIndex + 1 == t.song_id
				song = t
			end
		end
		
		if song == nil
			out = "color: white"
		else
			out = "color: yellow"
		end
		
		out
	end
end