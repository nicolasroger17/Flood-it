// Generated by CoffeeScript 1.8.0
var Grid;

Grid = (function() {
  function Grid(size, nbColor) {
    var column, i, row, that, _i, _j, _k, _ref, _ref1, _ref2;
    size = parseInt(size);
    this.grid = Array();
    this.totalMoves = Math.floor(size * (nbColor / 3.35));
    this.moves = 0;
    $("#board").empty();
    $("#board").css("width", size * 40 + 60);
    $("#board").css("height", size * 40 + 60);
    $("#panel").css("width", nbColor * 40 + 60);
    $("#colorPanel").empty();
    $("#colorPanel").css("width", nbColor * 40);
    $("#infos").empty();
    $("#infos").html('Moves: <span id="movesLeft"></span>/<span id="totalMoves"></span>');
    $("#movesLeft").html(this.moves);
    $("#totalMoves").html(this.totalMoves);
    for (i = _i = 0, _ref = nbColor - 1; 0 <= _ref ? _i <= _ref : _i >= _ref; i = 0 <= _ref ? ++_i : --_i) {
      $("#colorPanel").append("<div class='cell' state='" + i + "'></div>");
    }
    that = this;
    $("#colorPanel .cell").each(function() {
      $(this).click(function() {
        return that.change($(this));
      });
    });
    for (i = _j = 0, _ref1 = size * size - 1; 0 <= _ref1 ? _j <= _ref1 : _j >= _ref1; i = 0 <= _ref1 ? ++_j : --_j) {
      row = Math.floor(i / size);
      column = i % size;
      $("#board").append("<div class='cell' id='cell" + row + "x" + column + "'></div>");
      this.grid.push(new Cell(row, column, nbColor));
    }
    for (i = _k = 0, _ref2 = size * size - 1; 0 <= _ref2 ? _k <= _ref2 : _k >= _ref2; i = 0 <= _ref2 ? ++_k : --_k) {
      if (i > size) {
        this.grid[i].addNeighbour(this.grid[i - size]);
      }
      if (i % size > 0) {
        this.grid[i].addNeighbour(this.grid[i - 1]);
      }
      if ((i % size) < (size - 1)) {
        this.grid[i].addNeighbour(this.grid[i + 1]);
      }
      if (i < (size * (size - 1))) {
        this.grid[i].addNeighbour(this.grid[i + size]);
      }
      this.grid[i].display();
    }
  }

  Grid.prototype.change = function(square) {
    this.grid[0].change(square.attr("state"));
    this.moves++;
    $("#movesLeft").html(this.moves);
    if (this.checkWin()) {
      this.endOfGame(true);
    } else if (this.moves === this.totalMoves) {
      this.endOfGame(false);
    }
  };

  Grid.prototype.checkWin = function() {
    var i, _i, _ref;
    for (i = _i = 0, _ref = this.grid.length - 1; 0 <= _ref ? _i <= _ref : _i >= _ref; i = 0 <= _ref ? ++_i : --_i) {
      if (this.grid[i].state !== this.grid[0].state) {
        return false;
      }
    }
    return true;
  };

  Grid.prototype.endOfGame = function(isWin) {
    $("#colorPanel .cell").each(function() {
      return $(this).unbind();
    });
    $("#infos").html(isWin ? "WIN !!" : "LOST !!");
  };

  return Grid;

})();

//# sourceMappingURL=grid.js.map
