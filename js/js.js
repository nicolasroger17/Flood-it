var grid;

$(document).ready(function(){
	initializeMenu();
	newGame();

	$(".newgame:eq(0)").click(function(){
		newGame();
	});
});

function initializeMenu(){
	$('.grid-size').selectpicker();
	$('.grid-size').selectpicker('val', '10');
	$('.color-number').selectpicker();
}

function newGame(){
	grid = new Grid($('.grid-size').val(), $('.color-number').val())
}