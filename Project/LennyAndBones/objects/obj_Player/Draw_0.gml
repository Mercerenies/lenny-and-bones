var alpha = image_alpha;
if (!animating) {
  // We're in a static position, so place our hands there.
  var sidemask = Movement.sidemask(x, y);
  var rule = Movement.sidemaskRule(sidemask);
  var arr = Movement.playerHands(rule);
  draw_sprite_ext(spr_PlayerHand, 0, x + arr[0] * GRID_SIZE, y + arr[1] * GRID_SIZE, 1, 1, arr[2], c_white, alpha);
  draw_sprite_ext(spr_PlayerHand, 0, x + arr[3] * GRID_SIZE, y + arr[4] * GRID_SIZE, 1, 1, arr[5], c_white, alpha);
} else {
  // We're moving, so interpolate.
  var progress;
  if (src_x != dest_x) {
    progress = (x - src_x) / (dest_x - src_x);
  } else {
    progress = (y - src_y) / (dest_y - src_y);
  }
  var src_arr = Movement.playerHands(Movement.sidemaskRule(Movement.sidemask(src_x, src_y)));
  var dest_arr = Movement.playerHands(Movement.sidemaskRule(Movement.sidemask(dest_x, dest_y)));

  src_arr[0] = src_x + GRID_SIZE * src_arr[0];
  src_arr[1] = src_y + GRID_SIZE * src_arr[1];
  src_arr[3] = src_x + GRID_SIZE * src_arr[3];
  src_arr[4] = src_y + GRID_SIZE * src_arr[4];
  dest_arr[0] = dest_x + GRID_SIZE * dest_arr[0];
  dest_arr[1] = dest_y + GRID_SIZE * dest_arr[1];
  dest_arr[3] = dest_x + GRID_SIZE * dest_arr[3];
  dest_arr[4] = dest_y + GRID_SIZE * dest_arr[4];

  if (flying) {
    var target_angle = anim_index * 10;
    var flying_arr = [
      x + (GRID_SIZE / 2) + (GRID_SIZE / 2) * dcos(target_angle),
      y + (GRID_SIZE / 2) + (GRID_SIZE / 2) * dsin(target_angle),
      - target_angle,
      x + (GRID_SIZE / 2) - (GRID_SIZE / 2) * dcos(target_angle),
      y + (GRID_SIZE / 2) - (GRID_SIZE / 2) * dsin(target_angle),
      180 - target_angle,
    ];
    // If we didn't just leave a wall, then special-case the source array.
    if (!just_left_wall) {
      src_arr = flying_arr;
    }
    // If we aren't about to arrive, then special-case the destination array.
    var tx = 2 * dest_x - src_x;
    var ty = 2 * dest_y - src_y;
    if (!Movement.magnetAt(tx, ty)) {
      dest_arr = flying_arr;
    }
  }
  var lhs_x = lerp(src_arr[0], dest_arr[0], progress);
  var lhs_y = lerp(src_arr[1], dest_arr[1], progress);
  var lhs_r = angle_lerp(src_arr[2], dest_arr[2], progress);
  var rhs_x = lerp(src_arr[3], dest_arr[3], progress);
  var rhs_y = lerp(src_arr[4], dest_arr[4], progress);
  var rhs_r = angle_lerp(src_arr[5], dest_arr[5], progress);

  draw_sprite_ext(spr_PlayerHand, 0, lhs_x, lhs_y, 1, 1, lhs_r, c_white, alpha);
  draw_sprite_ext(spr_PlayerHand, 0, rhs_x, rhs_y, 1, 1, rhs_r, c_white, alpha);
}

draw_self();
