
image_alpha = 0.25;
if (ctrl_RoomManager.getHighlightedTetromino() == self.id) {
  if (is_undefined(ctrl_RoomManager.draggingTetromino)) {
    image_alpha = 1.0;
  }
}
if (ctrl_RoomManager.draggingTetromino == self.image_index) {
  image_alpha = 1.0;
}
if (count <= 0) {
  image_alpha = 0.1;
}

draw_self();

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_font(fnt_UI);
draw_set_color(c_white);
draw_text(x + text_x, y + text_y, string(count));

draw_set_halign(fa_left);
draw_set_valign(fa_top);
