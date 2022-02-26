
with (obj_TetrominoPlaceholder) {
  if (image_index == other.image_index) {
    other.count += 1;
    instance_destroy();
  }
}

if (count == 0) {
  visible = false;
}
