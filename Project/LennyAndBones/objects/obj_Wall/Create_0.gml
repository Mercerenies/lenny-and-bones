
sidemask = 0;

_setupSidemask = function() {
  sidemask = 0;
  if (!position_meeting(x + GRID_SIZE, y, obj_Wall)) {
    sidemask |= 1;
  }
  if (!position_meeting(x + GRID_SIZE, y + GRID_SIZE, obj_Wall)) {
    sidemask |= 2;
  }
  if (!position_meeting(x, y + GRID_SIZE, obj_Wall)) {
    sidemask |= 4;
  }
  if (!position_meeting(x - GRID_SIZE, y + GRID_SIZE, obj_Wall)) {
    sidemask |= 8;
  }
  if (!position_meeting(x - GRID_SIZE, y, obj_Wall)) {
    sidemask |= 16;
  }
  if (!position_meeting(x - GRID_SIZE, y - GRID_SIZE, obj_Wall)) {
    sidemask |= 32;
  }
  if (!position_meeting(x, y - GRID_SIZE, obj_Wall)) {
    sidemask |= 64;
  }
  if (!position_meeting(x + GRID_SIZE, y - GRID_SIZE, obj_Wall)) {
    sidemask |= 128;
  }
  // Exceptions for the edge of the map.
  if (x == 64) {
    sidemask &= ~56;
  }
  if (y == 64) {
    sidemask &= ~224;
  }
  if (x == 672) {
    sidemask &= ~131;
  }
  if (y == 672) {
    sidemask &= ~14;
  }
};
