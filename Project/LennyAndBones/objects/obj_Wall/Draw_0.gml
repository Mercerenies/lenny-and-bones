
draw_sprite(spr_WallImage, 0, x, y);
for (var i = 0; i < 8; i++) {
  if (sidemask & (1 << i)) {
    draw_sprite(spr_WallImage, i + 1, x, y);
  }
}

if (position_meeting(x, y, obj_FireTile)) {
  draw_sprite_ext(spr_FireTile, 0, x, y, 1, 1, 0, c_white, 0.5);
}