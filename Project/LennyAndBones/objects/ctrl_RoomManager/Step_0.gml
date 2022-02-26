
if (Input.wheelDown()) {
  globalBlockRot = (globalBlockRot + 1) % 4;
} else if (Input.wheelUp()) {
  globalBlockRot = (globalBlockRot + 3) % 4;
}

with (obj_TetrominoCounter) {
  image_angle = - other.globalBlockRot * 90;
}
