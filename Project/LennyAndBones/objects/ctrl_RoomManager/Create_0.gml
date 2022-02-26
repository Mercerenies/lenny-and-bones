
globalBlockRot = 0;

acceptingInput = function() {
  if (obj_Player.animating) {
    return false;
  }
  return true;
}

getHighlightedTetromino = function() {
  var inst = instance_position(mouse_x, mouse_y, obj_TetrominoCounter);
  if ((instance_exists(inst)) && (!inst.visible)) {
    return noone;
  } else {
    return inst;
  }
}
