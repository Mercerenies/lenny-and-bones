
function draw_arc(xx, yy, arcstart, arcend, rad, outline) {
  draw_primitive_begin(outline ? pr_linestrip : pr_trianglefan);
  draw_vertex(xx, yy);
  for (var i = 0; i < 100; i++) {
    var angle = - lerp(arcstart, arcend, i / 100);
    draw_vertex(xx + rad * dcos(angle), yy + rad * dsin(angle));
  }
  draw_primitive_end();
}
