
draw_sprite(spr_WallImage, 0, x, y);
for (var i = 0; i < 8; i++) {
  if (sidemask & (1 << i)) {
    draw_sprite(spr_WallImage, i + 1, x, y);
  }
}
