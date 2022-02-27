
animating = false;
flying = false;
just_left_wall = false;

move_dir = -1;

src_x = -1;
dest_x = -1;
src_y = -1;
dest_y = -1;

anim_index = 0;

isDead = function() {
  return image_alpha < 1;
}

win = function() {
  // TODO Animate me
  global.hideDialogue = false;
  room_goto_next();
}
