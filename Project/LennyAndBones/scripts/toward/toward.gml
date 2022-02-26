
function toward(v, targetv, spd) {
  if (abs(targetv - v) <= spd) {
    return targetv;
  }
  return v + spd * sign(targetv - v);
}