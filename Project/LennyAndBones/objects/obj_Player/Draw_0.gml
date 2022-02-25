
if ((x % 32 == 0) && (y % 32 == 0)) {
  var sidemask = Movement.sidemask(x, y);
  var rule = Movement.sidemaskRule(sidemask);
  var arr = Movement.playerHands(rule);
  draw_sprite_ext(spr_PlayerHand, 0, x + arr[0] * GRID_SIZE, y + arr[1] * GRID_SIZE, 1, 1, arr[2], c_white, 1);
  draw_sprite_ext(spr_PlayerHand, 0, x + arr[3] * GRID_SIZE, y + arr[4] * GRID_SIZE, 1, 1, arr[5], c_white, 1);
}

draw_self();
