<?php
$MAX_SIZE = 24;
$COLORS = array("blue", "green", "red", "yellow", "teal", "orange", "grey", "black", "brown");

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
			<div class="settings">
				<h2>Settings</h2>
				<select class="grid-size">
					<?php
						for($i = 2; $i <= $MAX_SIZE; $i += 2)
							echo "<option value='" . $i . "'>" . $i . "x" . $i . "</option>";
					?>
				</select>
				<select class="color-number">
					<?php
						for($i = 4; $i < count($COLORS); $i++)
							echo "<option value='" . $i . "'>" . $i . "</option>";
					?>
				</select>
				<button type="button" class="newgame btn btn-info">New Game</button>
			</div>
			<div id="game"><!--1.8-->
				<div id="panel">
					<h4>Moves: <span id="movesLeft"></span>/<span id="totalMoves"></span></h4>
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