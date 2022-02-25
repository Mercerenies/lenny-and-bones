
var MOVE_SPEED = 2;
var FLY_SPEED = 4;

if (animating) {
  if (flying) {
    x += FLY_SPEED * dcos(move_dir * 90);
    y += FLY_SPEED * dsin(move_dir * 90);
  } else {
    x += MOVE_SPEED * dcos(move_dir * 90);
    y += MOVE_SPEED * dsin(move_dir * 90);
  }
  if ((x % GRID_SIZE == 0) && (y % GRID_SIZE == 0)) {
    var nextx = x + GRID_SIZE * dcos(move_dir * 90);
    var nexty = y + GRID_SIZE * dsin(move_dir * 90);
    src_x = x;
    src_y = y;
    dest_x = nextx;
    dest_y = nexty;
    if ((!flying) || (Movement.magnetAt(nextx, nexty))) {
      animating = false;
      flying = false;
      move_dir = -1;
    }
  }
} else {
  var input_key = Input.getDirection();
  if (input_key != InputKey.None) {
    var targetx = x + GRID_SIZE * dcos(input_key * 90);
    var targety = y + GRID_SIZE * dsin(input_key * 90);
    if (!Movement.magnetAt(targetx, targety)) {
      if (Movement.magnetsAdjacentTo(targetx, targety) > 0) {
        // Standard move
        animating = true;
        move_dir = input_key;
        flying = false;
      } else {
        // Flying move
        animating = true;
        move_dir = input_key;
        flying = true;
      }
      src_x = x;
      src_y = y;
      dest_x = x + GRID_SIZE * dcos(move_dir * 90);
      dest_y = y + GRID_SIZE * dsin(move_dir * 90);
    }
  }
}
