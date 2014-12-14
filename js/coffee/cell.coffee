class Cell
	constructor: (@row, @column, nbColor) ->
	  @state = null
	  @prevState = null
	  @neighbours = Array()

	display: () ->
	  $("#cell" + @row + "x" + @column).attr("color", @state)
	  return

	initialize: (state) ->
	  @state = state
	  @prevState = state
	  display()
	  return

	addNeighbour: (cell) ->
	  @neighbours.push(cell)
	  return

	notify: (color) ->
	  @prevState = @state
	  @state = color
	  display()
	  for i in @neighbours.length
	  	@neighbours[i].notify @state @prevState
	  return

	notify: (current, previous) ->
	  if @state is previous and @state is not current
	    @prevState = state
	    @state = current
	    display()
	    for i in @neighbours.length
	      @neighbours[i].notify(@state, @prevState)
  	  return