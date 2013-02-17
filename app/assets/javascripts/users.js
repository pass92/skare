

$(document).ready(function(){
    $('#img-chg').hide();
    $('img').click(function(){
	$('#img-chg').fadeToggle('slow');
    });
});