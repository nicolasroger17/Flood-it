class Grid
	constructor: (size, nbColor) ->
	  size = parseInt(size)
	  @grid = Array()
	  @totalMoves = Math.floor(size*(nbColor/3.35))
	  @moves = 0
	  $("#board").empty()
	  $("#board").css("width", size * 40 + 60)
	  $("#board").css("height", size * 40 + 60)

	  $("#panel").css("width", nbColor * 40 + 60)
	  $("#colorPanel").empty()
	  $("#colorPanel").css("width", nbColor * 40)
	  $("#infos").empty()
	  $("#infos").html('Moves: <span id="movesLeft"></span>/<span id="totalMoves"></span>')
	  $("#movesLeft").html(@moves);
	  $("#totalMoves").html(@totalMoves)

	  for i in [0..nbColor - 1]
	    $("#colorPanel").append("<div class='cell' state='" + i + "'></div>")

	  that = this
	  $("#colorPanel .cell").each () ->
	    $(this).click () ->
	      that.change($(this))
	    return

	  for i in [0..size*size - 1]
	    row = Math.floor(i / size)
	    column = i % size
	    $("#board").append("<div class='cell' id='cell" + row + "x" + column + "'></div>")
	    @grid.push(new Cell(row, column, nbColor))

	  for i in [0..size*size - 1]
	    if i > size # below
	      @grid[i].addNeighbour(@grid[i - size])
	    if i % size > 0 # left
	      @grid[i].addNeighbour(@grid[i - 1])
	    if (i % size) < (size - 1)
	      @grid[i].addNeighbour(@grid[i + 1])
	    if i < (size * (size - 1))
	      @grid[i].addNeighbour(@grid[i + size])
	    @grid[i].display();

	change: (square) ->
	  @grid[0].change(square.attr("state"));
	  @moves++;
	  $("#movesLeft").html(@moves);
	  if(@checkWin())
	    @endOfGame(true)
	  else if(@moves is @totalMoves)
	  	@endOfGame(false)
	  return

	checkWin: ->
	  for i in [0..@grid.length - 1]
	  	if(@grid[i].state != @grid[0].state)
	      return false
	  return true

	endOfGame: (isWin) ->
	  $("#colorPanel .cell").each () ->
	    $(this).unbind()
	  $("#infos").html( if isWin then "WIN !!" else "LOST !!")
	  return