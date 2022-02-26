
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
