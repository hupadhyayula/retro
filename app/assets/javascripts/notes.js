// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function(){
	
	var count = 3;
	var voting_map = {};

	$('#finish_retro').click(function(){
		
		// are you sure you want to close?
		var sretroId = $('#finish_retro').data('sretro-id');

		var request = $.ajax({
			method: 'patch',
			url: "/sretros/"+sretroId +"/retro_notes/close"
		});

		request.done(function(msg){
			window.location.replace("/sretros");
		});

		request.fail(function(msg){
			console.log(msg);
		});
	});

	$(".note_vote_class").click(function(){
		console.log(count--);
	});

});