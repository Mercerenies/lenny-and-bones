
if (!is_undefined(draggingTetromino)) {
  draw_sprite_ext(spr_Tetromino, draggingTetromino, mouse_x - draggingX, mouse_y - draggingY, 1, 1, - globalBlockRot * 90, c_white, 0.5);
}
