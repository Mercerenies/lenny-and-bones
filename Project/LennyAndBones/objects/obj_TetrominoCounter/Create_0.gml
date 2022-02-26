
count = 0;

image_xscale = 1;
image_yscale = 1;
image_speed = 0;

text_x = 0;
text_y = 0;

toTetromino = function() {
  var rot = ctrl_RoomManager.globalBlockRot;
  var base = Blocks.fromIndex(image_index);
  return base.rotated(rot);
}
