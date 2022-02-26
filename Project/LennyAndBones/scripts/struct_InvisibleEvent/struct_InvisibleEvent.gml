
function InvisibleEvent(obj_) : UndoEvent() constructor {
  obj = obj_;

  static run = function() {
    obj.visible = true;
  }

}
