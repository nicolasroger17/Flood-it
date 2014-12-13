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
	console.log($('.grid-size').val());
	console.log($('.color-number').val());
}