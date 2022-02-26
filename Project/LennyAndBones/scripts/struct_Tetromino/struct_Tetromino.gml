
// Takes an array of points.
function Tetromino(arr_) constructor {
  arr = arr_;

  static rotateClockwise = function() {
    var new_arr = [];
    for (var i = 0; i < array_length(arr); i++) {
      new_arr[i] = new Point(-arr[i].y, arr[i].x);
    }
    return new Tetromino(new_arr);
  }

  static rotateCounterclockwise = function() {
    var new_arr = [];
    for (var i = 0; i < array_length(arr); i++) {
      new_arr[i] = new Point(arr[i].y, arr[i].x);
    }
    return new Tetromino(new_arr);
  }

}
