class Cell
	constructor: (@row, @column, nbColor) ->
	  @neighbours = Array()
	  @state = Math.floor(Math.random() * nbColor)
	  @prevState = @state

	display: ->
	  $("#cell" + @row + "x" + @column).attr("state", @state)
	  return

	addNeighbour: (cell) ->
	  @neighbours.push(cell)
	  return

	change: (color) ->
	  @prevState = @state
	  @state = color
	  this.display()
	  for i in [0..@neighbours.length - 1]
	    @neighbours[i].notify(@state, @prevState)
	  return

	notify: (current, previous) ->
	  current = parseInt(current)
	  previous = parseInt(previous)
	  if @state == previous and @state != current
	    @prevState = @state
	    @state = current
	    this.display()
	    for i in [0..@neighbours.length - 1]
	      @neighbours[i].notify(@state, @prevState)
  	  return