
function PlayerMoveEvent(xx_, yy_) : UndoEvent() constructor {
  xx = xx_;
  yy = yy_;

  static run = function() {
    obj_Player.x = xx;
    obj_Player.y = yy;
    obj_Player.src_x = -1;
    obj_Player.src_y = -1;
    obj_Player.dest_x = -1;
    obj_Player.dest_y = -1;
    obj_Player.animating = false;
    obj_Player.flying = false;
    obj_Player.just_left_wall = false;
    obj_Player.move_dir = -1;
    obj_Player.image_alpha = 1;
  }

}
