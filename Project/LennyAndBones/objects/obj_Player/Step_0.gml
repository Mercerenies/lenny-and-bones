
var MOVE_SPEED = 2;

if (animating) {
  x += MOVE_SPEED * dcos(move_dir * 90);
  y += MOVE_SPEED * dsin(move_dir * 90);
  if ((x % GRID_SIZE == 0) && (y % GRID_SIZE == 0)) {
    animating = false;
    move_dir = -1;
  }
} else {
  var input_key = Input.getDirection();
  if (input_key != InputKey.None) {
    var targetx = x + GRID_SIZE * dcos(input_key * 90);
    var targety = y + GRID_SIZE * dsin(input_key * 90);
    if ((!Movement.magnetAt(targetx, targety)) && (Movement.magnetsAdjacentTo(targetx, targety) > 0)) {
      animating = true;
      move_dir = input_key;
    }
  }
}
