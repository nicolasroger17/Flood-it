class Grid
	constructor: (size, nbColor) ->
	  @grid = Array()
	  $("#board").empty()
	  for i in [0..size*size - 1]
	    row = Math.floor(i / size)
	    column = i % size
	    $("#game").css("width", size*60 + 60);
	    $("#game").css("height", size*60 + 60);
	    $("#board").css("width", size*60);
	    $("#board").css("height", size*60);
	    $("#board").append("<div class='cell' id='cell" + row + "x" + column + "'></div>")
	    @grid.push(new Cell(row, column, nbColor))

	  for i in [0..size*size - 1]
	    if i > size
	      @grid[i].addNeighbour(@grid[i - size])
	    if i % size > 0
	      @grid[i].addNeighbour(@grid[i - 1])
	    if (i % size) < (size - 1)
	      @grid[i].addNeighbour(@grid[i + 1])
	    if i < (size * (size - 1))
	      @grid[i].addNeighbour(@grid[i + size])

	change: (color) ->
	  @grid[0].notify(color);