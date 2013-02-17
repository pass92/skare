

$(document).ready(function(){
    $('p.options').hide()
    $('div.cap-post').hover(function(){
	$(this).css('background-color', '#E5E5E5');
	$(this).children('p.options').fadeIn('slow');
    },function(){
	$(this).children('p.options').hide();
	$(this).css('background-color', 'white');
    });
});