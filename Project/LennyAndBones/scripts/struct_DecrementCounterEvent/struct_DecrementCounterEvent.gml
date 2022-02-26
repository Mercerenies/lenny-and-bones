
function DecrementCounterEvent(obj_) : UndoEvent() constructor {
  obj = obj_;

  static run = function() {
    obj.count += 1;
  }

}
