
var basex = 96;
var basey = 576;

if (isActive()) {
  var curr = getCurrent();

  draw_set_font(fnt_Dialogue);
  draw_set_color(c_white);

  draw_text_ext(basex, basey, display_text, 24, 672);

  draw_sprite(spr_HeadshotFrame, 0, basex - 80, basey + 32);
  draw_sprite_ext(spr_Headshots, curr.sprite, basex - 16, basey + 32, -1, 1, 0, c_white, 1);

}
