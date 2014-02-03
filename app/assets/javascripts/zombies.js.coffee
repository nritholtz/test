# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
	$('div#custom_phase2 form').submit (event) ->
		event.preventDefault()

		url = $(this).attr('action')
		custom_decomp=$('div#custom_phase2 #zombie_decomp').val()

		$.ajax
			type: 'put'
			url: url
			data: { zombie: { rotting: custom_decomp } }
			dataType: 'json'
			success: (json) ->
				$('#decomp').text(json.rotting).effect('highlight')
				$('div#custom_phase2').fadeOut() if json.decomp == true