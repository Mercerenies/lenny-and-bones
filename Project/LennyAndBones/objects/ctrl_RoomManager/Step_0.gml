
if (Input.wheelDown()) {
  globalBlockRot = (globalBlockRot + 1) % 4;
} else if (Input.wheelUp()) {
  globalBlockRot = (globalBlockRot + 3) % 4;
}

with (obj_TetrominoCounter) {
  image_angle = - other.globalBlockRot * 90;
}

if (Input.mouseDown()) {
  var highlighted = getHighlightedTetromino();
  if (instance_exists(highlighted)) {
    draggingTetromino = highlighted.image_index;
    draggingX = mouse_x - highlighted.x;
    draggingY = mouse_y - highlighted.y;
  }
}

if (Input.mouseUp()) {

  if ((acceptingInput()) && (!is_undefined(draggingTetromino))) {
    var tetromino = toTetromino();
    var target = getMouseTarget();
    if (!is_undefined(target)) {
      /////
      tetromino.placeAt(target.xx, target.yy);
      with (obj_TetrominoCounter) {
        if (other.draggingTetromino == image_index) {
          count -= 1;
        }
      }
    }
  }

  draggingTetromino = undefined;
  draggingX = 0;
  draggingY = 0;
}
