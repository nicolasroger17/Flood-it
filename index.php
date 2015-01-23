<?php
$MAX_SIZE = 24;
$COLORS = array("blue", "grey", "red", "yellow", "teal", "orange", "green", "black", "brown");

?>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="icon" type="image/png" href="favicon.png" />
		<title>Flood it</title>
		<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="css/bootstrap-select.min.css">
		<link rel="stylesheet" type="text/css" href="css/style.css">
	</head>
	<body>
		<h1>Flood it</h1>
		<div class="content">
			<div id='rules'>
				<h2>Rules</h2>
				<p>
					The goal is to fill the grid with only one color <br>
					To achieve this, you can change the top left tile color, and it will change the color <br>
					Of its neighbours if they have of the same color.
				</p>
			</div>
			<div class="settings">
				<h2>Settings</h2>
				<label>Grid:
					<select class="grid-size">
						<?php
							for($i = 2; $i <= $MAX_SIZE; $i += 2)
								echo "<option value='" . $i . "'>" . $i . "x" . $i . "</option>";
						?>
					</select>
				</label>
				<label>Number of colors:
					<select class="color-number">
						<?php
							for($i = 4; $i < count($COLORS); $i++)
								echo "<option value='" . $i . "'>" . $i . "</option>";
						?>
					</select>
				</label>
				<button type="button" class="newgame btn btn-info">New Game</button>
			</div>
			<div id="game"><!--1.8-->
				<div id="panel">
					<h4 id="infos">Moves: <span id="movesLeft"></span>/<span id="totalMoves"></span></h4>
					<div id="colorPanel"></div>
				</div>
				<div id="board"></div>
			</div>
		</div>
		<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
		<script type="text/javascript" src='js/bootstrap.min.js'></script>
		<script type="text/javascript" src='js/bootstrap-select.min.js'></script>
		<script type="text/javascript" src="js/grid.js"></script>
		<script type="text/javascript" src="js/cell.js"></script>
		<script type="text/javascript" src="js/js.js"></script>
	</body>
</html>