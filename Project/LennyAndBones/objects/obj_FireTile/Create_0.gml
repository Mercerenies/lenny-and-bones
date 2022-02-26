
emitter = part_emitter_create(ctrl_ParticleManager.system);
part_emitter_region(ctrl_ParticleManager.system, emitter, x + 8, x + 24, y + 8, y + 24, ps_shape_ellipse, ps_distr_invgaussian);