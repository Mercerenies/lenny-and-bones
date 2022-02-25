
#macro Movement global.__module_Movement

Movement = {}

Movement.magnetAt = function(xx, yy) {
  return position_meeting(xx, yy, obj_Wall);
}

Movement.magnetsAdjacentTo = function(xx, yy) {
  var count = 0;
  for (var x1 = xx - GRID_SIZE; x1 <= xx + GRID_SIZE; x1 += GRID_SIZE) {
    for (var y1 = yy - GRID_SIZE; y1 <= yy + GRID_SIZE; y1 += GRID_SIZE) {
      if ((x1 == xx) && (y1 == yy)) {
        continue;
      }
      if (position_meeting(x1, y1, obj_Wall)) {
        count += 1;
      }
    }
  }
  return count;
};
