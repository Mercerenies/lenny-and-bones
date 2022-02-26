
// Takes an array of points.
function Tetromino(arr_) constructor {
  arr = arr_;

  static rotatedClockwise = function() {
    var new_arr = [];
    for (var i = 0; i < array_length(arr); i++) {
      new_arr[i] = new Point(-arr[i].yy, arr[i].xx);
    }
    return new Tetromino(new_arr);
  }

  static rotatedCounterclockwise = function() {
    var new_arr = [];
    for (var i = 0; i < array_length(arr); i++) {
      new_arr[i] = new Point(arr[i].yy, arr[i].xx);
    }
    return new Tetromino(new_arr);
  }

  static rotated = function(count) {
    var result = self;
    if (count > 0) {
      for (var i = 0; i < count; i += 1) {
        result = result.rotatedClockwise();
      }
    } else {
      for (var i = 0; i > count; i -= 1) {
        result = result.rotatedCounterclockwise();
      }
    }
    return result;
  }

  // Precondition: canPlaceAt(xx, yy) shall be true.
  static placeAt = function(xx, yy) {
    var instances = [];
    var xoffset = 9999;
    for (var i = 0; i < array_length(arr); i++) {
      var point = arr[i];
      instances[i] = instance_create_layer(xx + GRID_SIZE * point.xx + xoffset, yy + GRID_SIZE * point.yy, "Instances", obj_Wall);
    }
    for (var i = 0; i < array_length(instances); i++) {
      instances[i].setupSidemask();
    }
    for (var i = 0; i < array_length(instances); i++) {
      instances[i].x -= xoffset;
      ctrl_UndoManager.pushStack(new PlaceWallEvent(instances[i]));
    }
    return true;
  }

  static canPlaceAt = function(xx, yy) {
    for (var i = 0; i < array_length(arr); i++) {
      var point = arr[i];
      if (Movement.solidAt(xx + GRID_SIZE * point.xx, yy + GRID_SIZE * point.yy)) {
        return false;
      }
    }
    return true;
  }

  // dir should be a direction in degrees (clockwise) to project in.
  // Returns a Point or undefined.
  static project = function(startx, starty, dir) {
    var xx = startx;
    var yy = starty;
    var steps = 0;

    // Special case if we're projecting from inside a wall.
    if (Movement.magnetAt(xx, yy)) {
      return undefined;
    }

    // First, go until we hit a wall.
    while (!Movement.magnetAt(xx + GRID_SIZE * dcos(dir), yy + GRID_SIZE * dsin(dir))) {
      xx += GRID_SIZE * dcos(dir);
      yy += GRID_SIZE * dsin(dir);
      steps += 1;
      // Safeguard for silly mistakes
      if (steps > 100) {
        return undefined;
      }
    }

    // Then double back and try to place it.
    while (steps > 0) {
      if (self.canPlaceAt(xx, yy)) {
        return new Point(xx, yy);
      }
      xx -= GRID_SIZE * dcos(dir);
      yy -= GRID_SIZE * dsin(dir);
      steps--;
    }

    // Otherwise, we can't place it.
    return undefined;

  }

}
