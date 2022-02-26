
var spd = 8;

image_angle += 5;

x = toward(x, dest_x, spd);
y = toward(y, dest_y, spd);

if ((x == dest_x) && (y == dest_y)) {
  on_arrive.call();
  instance_destroy();
}