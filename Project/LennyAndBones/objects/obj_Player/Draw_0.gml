
if (flying) {
  // TODO /////
} else if (!animating) {
  // We're in a static position, so place our hands there.
  var sidemask = Movement.sidemask(x, y);
  var rule = Movement.sidemaskRule(sidemask);
  var arr = Movement.playerHands(rule);
  draw_sprite_ext(spr_PlayerHand, 0, x + arr[0] * GRID_SIZE, y + arr[1] * GRID_SIZE, 1, 1, arr[2], c_white, 1);
  draw_sprite_ext(spr_PlayerHand, 0, x + arr[3] * GRID_SIZE, y + arr[4] * GRID_SIZE, 1, 1, arr[5], c_white, 1);
} else {
  // We're moving and not flying, so interpolate.
  var progress;
  if (src_x != dest_x) {
    progress = (x - src_x) / (dest_x - src_x);
  } else {
    progress = (y - src_y) / (dest_y - src_y);
  }
  var src_arr = Movement.playerHands(Movement.sidemaskRule(Movement.sidemask(src_x, src_y)));
  var dest_arr = Movement.playerHands(Movement.sidemaskRule(Movement.sidemask(dest_x, dest_y)));
  var lhs_x = lerp(src_x + GRID_SIZE * src_arr[0], dest_x + GRID_SIZE * dest_arr[0], progress);
  var lhs_y = lerp(src_y + GRID_SIZE * src_arr[1], dest_y + GRID_SIZE * dest_arr[1], progress);
  var lhs_r = angle_lerp(src_arr[2], dest_arr[2], progress);
  var rhs_x = lerp(src_x + GRID_SIZE * src_arr[3], dest_x + GRID_SIZE * dest_arr[3], progress);
  var rhs_y = lerp(src_y + GRID_SIZE * src_arr[4], dest_y + GRID_SIZE * dest_arr[4], progress);
  var rhs_r = angle_lerp(src_arr[5], dest_arr[5], progress);
  draw_sprite_ext(spr_PlayerHand, 0, lhs_x, lhs_y, 1, 1, lhs_r, c_white, 1);
  draw_sprite_ext(spr_PlayerHand, 0, rhs_x, rhs_y, 1, 1, rhs_r, c_white, 1);
  // TODO Proper interpolation on rotations (lerp fails us here)
}

draw_self();
