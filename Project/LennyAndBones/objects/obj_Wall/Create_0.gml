
sidemask = 0;

_setupSidemask = function() {
  sidemask = 255 & ~Movement.sidemask(x, y);
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
