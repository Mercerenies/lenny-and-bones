
globalBlockRot = 0;

acceptingInput = function() {
  if (obj_Player.animating) {
    return false;
  }
  return true;
}

getHighlightedTetromino = function() {
  return instance_position(mouse_x, mouse_y, obj_TetrominoCounter);
}
