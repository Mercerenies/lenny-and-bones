
obj_Player.image_alpha = toward(obj_Player.image_alpha, 0, 0.1);
if (obj_Player.image_alpha <= 0) {
  instance_destroy();
}