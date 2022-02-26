
if (position_meeting(x, y, obj_Wall)) {
  part_emitter_burst(ctrl_ParticleManager.system, emitter, ctrl_ParticleManager.poison, 20);
  if ((!obj_Player.isDead()) && (!instance_exists(obj_DyingAnim))) {
    instance_create_layer(-128, -128, "Instances_UI", obj_DyingAnim);
  }
}
