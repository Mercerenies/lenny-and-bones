
image_xscale = 0.2;
image_yscale = 0.2;
image_angle = random(360);
image_speed = 0;

dest_x = x;
dest_y = y;

on_arrive = {
  "call": function() {
    // Can be overridden to provide behavior when we get there.
  }
};