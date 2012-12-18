$(document).ready(function(){
	$("img.game_icons").click(function() {
	  $("img.game_icons").removeClass('highlighted');
	  $(this).addClass('highlighted');
	  $("#game_icon_id").val($(this).data('icon-id'));
	});
});