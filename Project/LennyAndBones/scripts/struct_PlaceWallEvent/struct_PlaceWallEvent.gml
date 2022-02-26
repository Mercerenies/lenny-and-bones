
function PlaceWallEvent(obj_) : UndoEvent() constructor {
  obj = obj_;

  static run = function() {
    with (obj) {
      instance_destroy();
    }
  }

}
