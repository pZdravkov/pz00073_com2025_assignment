# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery(document).ready ($) ->
	

  $('#myCarousel').carousel interval: 5000
  
  #Handles the carousel thumbnails
  $('[id^=carousel-selector-]').click ->
  
    id_selector = $(this).attr('id')
    
    try
      id = /-(\d+)$/.exec(id_selector)[1]
      
      console.log id_selector, id
      
      jQuery('#myCarousel').carousel parseInt(id)
      
    catch e
      console.log 'Regex failed!', e
    return
    
  # When the carousel slides, auto update the text
  $('#myCarousel').on 'slid.bs.carousel', (e) ->
  
    id = $('.item.active').data('slide-number')
    
    $('#carousel-text').html $('#slide-content-' + id).html()
    return
  	
  return