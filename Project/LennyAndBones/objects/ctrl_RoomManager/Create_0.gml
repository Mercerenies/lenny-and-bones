
globalBlockRot = 0;

canFly = false;
canRotate = false;

draggingTetromino = undefined;
draggingX = 0;
draggingY = 0;

acceptingInput = function() {
  if (obj_Player.animating) {
    return false;
  }
  if (obj_Player.isDead()) {
    return false;
  }
  if (instance_exists(par_Animation)) {
    return false;
  }
  if (ctrl_DiaManager.isActive()) {
    return false;
  }
  return true;
}

// Like acceptingInput but still permissible if the player is dead.
canUndo = function() {
  if (obj_Player.animating) {
    return false;
  }
  if (instance_exists(par_Animation)) {
    return false;
  }
  if (ctrl_DiaManager.isActive()) {
    return false;
  }
  return true;
}

getHighlightedTetromino = function() {
  if ((obj_Player.isDead()) || (ctrl_DiaManager.isActive())) {
    return noone;
  }
  var inst = instance_position(mouse_x, mouse_y, obj_TetrominoCounter);
  if (instance_exists(inst)) {
    if ((!inst.visible) || (inst.count <= 0)) {
      inst = noone;
    }
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
