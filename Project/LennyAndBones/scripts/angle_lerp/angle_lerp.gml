
function angle_lerp(a, b, xx) {
  // lerp but for angular values (in degrees).
  return a + lerp(0, angle_difference(b, a), xx);
}