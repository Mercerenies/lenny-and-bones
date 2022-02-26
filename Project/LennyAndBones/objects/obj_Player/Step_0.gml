
var MOVE_SPEED = 2;
var FLY_SPEED = 4;

anim_index += 1;

if (animating) {
  if (flying) {
    x += FLY_SPEED * dcos(move_dir * 90);
    y += FLY_SPEED * dsin(move_dir * 90);
  } else {
    x += MOVE_SPEED * dcos(move_dir * 90);
    y += MOVE_SPEED * dsin(move_dir * 90);
  }
  if ((x % GRID_SIZE == 0) && (y % GRID_SIZE == 0)) {
    just_left_wall = false;
    var nextx = x + GRID_SIZE * dcos(move_dir * 90);
    var nexty = y + GRID_SIZE * dsin(move_dir * 90);
    src_x = x;
    src_y = y;
    dest_x = nextx;
    dest_y = nexty;
    if ((isDead()) || (!flying) || (Movement.magnetAt(nextx, nexty))) {
      animating = false;
      flying = false;
      move_dir = -1;
    }

    // Check for death :(
    if (position_meeting(x, y, obj_FireTile)) {
      instance_create_layer(-128, -128, "Instances_UI", obj_DyingAnim);
    }

    // Check for winning :)
    if ((!animating) && (!isDead()) && (!instance_exists(obj_DyingAnim)) && (position_meeting(x, y, obj_LeverTile))) {
      win();
    }

  }
}
if (ctrl_RoomManager.acceptingInput()) {
  var input_key = Input.getDirection();
  if (input_key != InputKey.None) {
    var targetx = x + GRID_SIZE * dcos(input_key * 90);
    var targety = y + GRID_SIZE * dsin(input_key * 90);
    if (!Movement.magnetAt(targetx, targety)) {
      var okay = true;
      if (Movement.magnetsAdjacentTo(targetx, targety) > 0) {
        // Standard move
        animating = true;
        move_dir = input_key;
        flying = false;
      } else if (ctrl_RoomManager.canFly) {
        // Flying move
        animating = true;
        move_dir = input_key;
        flying = true;
        just_left_wall = true;
      } else {
        okay = false;
      }
      if (okay) {
        ctrl_UndoManager.pushStack(UndoCut);
        ctrl_UndoManager.pushStack(new PlayerMoveEvent(x, y));
        src_x = x;
        src_y = y;
        dest_x = x + GRID_SIZE * dcos(move_dir * 90);
        dest_y = y + GRID_SIZE * dsin(move_dir * 90);
      }
    }
  }
}
