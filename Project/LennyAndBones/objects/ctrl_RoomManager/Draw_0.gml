
if (!is_undefined(draggingTetromino)) {
  var tx = mouse_x - draggingX;
  var ty = mouse_y - draggingY;

  if (ctrl_RoomManager.acceptingInput()) {
    var mouse_target = getMouseTarget();
    if (!is_undefined(mouse_target)) {
      tx = mouse_target.xx + GRID_SIZE / 2;
      ty = mouse_target.yy + GRID_SIZE / 2;
    }
  }

  draw_sprite_ext(spr_Tetromino, draggingTetromino, tx, ty, 1, 1, - globalBlockRot * 90, c_white, 0.5);
}
