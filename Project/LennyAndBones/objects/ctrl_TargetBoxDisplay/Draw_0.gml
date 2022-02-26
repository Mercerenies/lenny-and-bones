
var highlighted_tetromino = ctrl_RoomManager.getHighlightedTetromino();
var projected_tetromino = undefined;
if (!is_undefined(ctrl_RoomManager.draggingTetromino)) {
  projected_tetromino = Blocks.fromIndex(ctrl_RoomManager.draggingTetromino).rotated(ctrl_RoomManager.globalBlockRot);
} else if (instance_exists(highlighted_tetromino)) {
  projected_tetromino = highlighted_tetromino.toTetromino();
}

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

  if (!is_undefined(projected_tetromino)) {

    // Show where the block would end up in each direction.
    for (var dir = 0; dir < 360; dir += 90) {

      var target_point = projected_tetromino.project(obj_Player.x, obj_Player.y, dir);

      if (!is_undefined(target_point)) {
        for (var i = 0; i < array_length(projected_tetromino.arr); i++) {
          var xx = target_point.xx + GRID_SIZE * projected_tetromino.arr[i].xx;
          var yy = target_point.yy + GRID_SIZE * projected_tetromino.arr[i].yy;
          draw_sprite(spr_BlockTargetBox, image_index, xx, yy);
        }
      }

    }

  }

}
draw_set_alpha(1);
