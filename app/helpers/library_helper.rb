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
	
	
end
