class Cell
	constructor: (@row, @column, nbColor) ->
	  @neighbours = Array()
	  @state = parseInt(Math.floor(Math.random() * nbColor))
	  @prevState = @state

	display: (isFirst) ->
	  isFirst = if isFirst then isFirst else true;
	  console.log("bouh");
	  c = $("#cell" + @row + "x" + @column)
	  flipPos = if c.attr("position") == "front" && !isFirst then "back" else "front";
	  c.attr("position", flipPos);

	  that = this
	  c.find("." + flipPos).attr("state", that.state)
	  c.css("transform", "rotateX(" + @getRotationCycle(c, 'X') + "deg)")
	  return

	addNeighbour: (cell) ->
	  @neighbours.push(cell)
	  return

	change: (color) ->
	  @prevState = @state
	  @state = parseInt(color)
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

	getRotationCycle: (element, axis) ->
	  matrixStyle = element.css('transform')
	  
	  if (matrixStyle is "none")
	      return 180;

	  matrix = WebKitCSSMatrix && (new WebKitCSSMatrix(matrixStyle)) || 
	             MozCSSMatrix && (new MozCSSMatrix(matrixStyle)) || 
	             MsCSSMatrix && (new MsCSSMatrix(matrixStyle)) || 
	             OCSSMatrix && (new OCSSMatrix(matrixStyle)) ||     
	             CSSMatrix && (new CSSMatrix(matrixStyle))

	  switch axis.toUpperCase()
	    when 'X'then rotation = Math.acos(matrix.a)
	    when 'Y'then rotation = Math.asin(matrix.b)
	    else throw "This function accepts rotation axis name (string) as the first parameter. Possible values: 'X', 'Y', 'Z'";

	  rotation *= 180/Math.PI; # getting rotation in degrees. This is good for me for debug purposes but bad for performance, of course, ...

	  return rotation % 360; # ... so you can skip degrees and do it in radians only