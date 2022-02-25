
draw_set_alpha(image_alpha);
if (ctrl_RoomManager.acceptingInput()) {

  // Show where we would end up for every button we could press.
  for (var dir = 0; dir < 360; dir += 90) {

    var targetx = obj_Player.x + GRID_SIZE * dcos(dir);
    var targety = obj_Player.y + GRID_SIZE * dsin(dir);

    if (Movement.magnetAt(targetx, targety)) {
      // Can't move here, so draw nothing.
      continue;
    }

    if (Movement.magnetsAdjacentTo(targetx, targety) > 0) {
      // Regular move
      draw_sprite(spr_TargetBox, image_index, targetx, targety);
    } else {
      // Flying move
      var loopcount = 0;
      while (!Movement.magnetAt(targetx + GRID_SIZE * dcos(dir), targety + GRID_SIZE * dsin(dir))) {
        targetx += GRID_SIZE * dcos(dir);
        targety += GRID_SIZE * dsin(dir);
        loopcount++;
        if (loopcount > 100) {
          // Failsafe in case I do something boneheaded.
          break;
        }
      }
      draw_sprite(spr_TargetBox, image_index, targetx, targety);
    }

  }

}
draw_set_alpha(1);