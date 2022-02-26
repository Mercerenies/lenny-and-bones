
emitter = part_emitter_create(ctrl_ParticleManager.system);
part_emitter_region(ctrl_ParticleManager.system, emitter, x + 8, x + 24, y + 8, y + 24, ps_shape_ellipse, ps_distr_invgaussian);

image_alpha = 0.5;

checkPoisonRelease = function() {
  if (position_meeting(x, y, obj_Wall)) {
    if ((!obj_Player.isDead()) && (!instance_exists(obj_DyingAnim))) {
      instance_create_layer(-128, -128, "Instances_UI", obj_DyingAnim);
      ctrl_UndoManager.pushStack(new PlayerMoveEvent(obj_Player.x, obj_Player.y));
    }
  }
}
