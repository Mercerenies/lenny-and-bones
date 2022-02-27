
if (!position_meeting(x, y, obj_Wall)) {
  var amount = 130;
  var fire_count = instance_number(obj_FireTile);
  amount -= min(fire_count * 5, 75);
  part_emitter_burst(ctrl_ParticleManager.system, emitter, ctrl_ParticleManager.player_fire, amount);
}
