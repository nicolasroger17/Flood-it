// Generated by CoffeeScript 1.8.0
var Cell;

Cell = (function() {
  function Cell(row, column, nbColor) {
    this.row = row;
    this.column = column;
    this.neighbours = Array();
    this.state = parseInt(Math.floor(Math.random() * nbColor));
    this.prevState = this.state;
  }

  Cell.prototype.display = function() {
    var c, that;
    c = $("#cell" + this.row + "x" + this.column);
    that = this;
    setTimeout((function() {
      c.attr("state", that.state);
    }), 150);
    c.css("transform", "rotateX(" + this.getRotationCycle(c, 'X') + "deg)");
  };

  Cell.prototype.addNeighbour = function(cell) {
    this.neighbours.push(cell);
  };

  Cell.prototype.change = function(color) {
    var i, _i, _ref;
    this.prevState = this.state;
    this.state = parseInt(color);
    this.display();
    for (i = _i = 0, _ref = this.neighbours.length - 1; 0 <= _ref ? _i <= _ref : _i >= _ref; i = 0 <= _ref ? ++_i : --_i) {
      this.neighbours[i].notify(this.state, this.prevState);
    }
  };

  Cell.prototype.notify = function(current, previous) {
    var i, _i, _ref;
    current = parseInt(current);
    previous = parseInt(previous);
    if (this.state === previous && this.state !== current) {
      this.prevState = this.state;
      this.state = current;
      this.display();
      for (i = _i = 0, _ref = this.neighbours.length - 1; 0 <= _ref ? _i <= _ref : _i >= _ref; i = 0 <= _ref ? ++_i : --_i) {
        this.neighbours[i].notify(this.state, this.prevState);
      }
    }
  };

  Cell.prototype.getRotationCycle = function(element, axis) {
    var matrix, matrixStyle, rotation;
    matrixStyle = element.css('transform');
    if (matrixStyle === "none") {
      return 180;
    }
    matrix = WebKitCSSMatrix && (new WebKitCSSMatrix(matrixStyle)) || MozCSSMatrix && (new MozCSSMatrix(matrixStyle)) || MsCSSMatrix && (new MsCSSMatrix(matrixStyle)) || OCSSMatrix && (new OCSSMatrix(matrixStyle)) || CSSMatrix && (new CSSMatrix(matrixStyle));
    switch (axis.toUpperCase()) {
      case 'X':
        rotation = Math.acos(matrix.a);
        break;
      case 'Y':
        rotation = Math.asin(matrix.b);
        break;
      default:
        throw "This function accepts rotation axis name (string) as the first parameter. Possible values: 'X', 'Y', 'Z'";
    }
    rotation *= 180 / Math.PI;
    return rotation % 360;
  };

  return Cell;

})();

//# sourceMappingURL=cell.js.map
