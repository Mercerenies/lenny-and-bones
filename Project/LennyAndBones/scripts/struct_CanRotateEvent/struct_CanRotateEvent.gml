
function CanRotateEvent() : UndoEvent() constructor {

  static run = function() {
    ctrl_RoomManager.canRotate = false;
    ctrl_RoomManager.globalBlockRot = ctrl_RoomManager.startBlockRot;
  }

}
