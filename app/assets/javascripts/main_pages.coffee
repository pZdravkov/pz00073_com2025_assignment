# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

title1 = "Easy, Powerful, Free"
title2 = "Sign up, NOW!"
title3 = "Want to know a bit about us?"

arr = [title1, title2, title3]

$(document).on 'turbolinks:load', ->

	$('#myCarousel').carousel
	  interval: 5000
	  cycle: true

	document.getElementById("dt").innerHTML = arr[0]
 	    
	$('#myCarousel').bind 'slid.bs.carousel', ->
  
		currentIndex = $('div.active').index()
		
		document.getElementById("dt").innerHTML = arr[currentIndex]
			
		true