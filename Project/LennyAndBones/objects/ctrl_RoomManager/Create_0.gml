
globalBlockRot = 0;

draggingTetromino = undefined;
draggingX = 0;
draggingY = 0;

acceptingInput = function() {
  if (obj_Player.animating) {
    return false;
  }
  return true;
}

getHighlightedTetromino = function() {
  var inst = instance_position(mouse_x, mouse_y, obj_TetrominoCounter);
  if ((instance_exists(inst)) && (!inst.visible)) {
    inst = noone;
  }
  return inst;
}

toTetromino = function(idx) {
  if (is_undefined(idx)) {
    idx = draggingTetromino;
  }
  return Blocks.fromIndex(idx).rotated(globalBlockRot);
}

// Get target for drag-and-drop based on current mouse position.
getMouseTarget = function() {
  if (is_undefined(draggingTetromino)) {
    return undefined;
  }
  var projected_tetromino = Blocks.fromIndex(draggingTetromino).rotated(globalBlockRot);
  var nearest = undefined;
  var nearest_distance = 999999;
  for (var i = 0; i < 4; i++) {
    var dir = i * 90;
    var projected = projected_tetromino.project(obj_Player.x, obj_Player.y, dir);
    if (!is_undefined(projected)) {
      var curr_distance = point_distance(mouse_x, mouse_y, projected.xx, projected.yy);
      if (curr_distance < nearest_distance) {
        nearest = projected;
        nearest_distance = curr_distance;
      }
    }
  }
  if (nearest_distance < 96) {
    return nearest;
  }
  return undefined;
}
