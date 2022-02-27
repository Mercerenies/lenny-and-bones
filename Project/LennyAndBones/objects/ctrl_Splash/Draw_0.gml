
var index;
if (tick < 3) {
  index = 0;
} else {
  index = 1;
}

var a = clamp(1.5 - abs((tick % 3) - 1.5), 0, 1);

draw_set_alpha(a);
draw_set_color(c_white);
draw_sprite(spr_SplashScreen, index, room_width / 2, room_height / 2);
draw_set_alpha(1);
