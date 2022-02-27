
system = part_system_create_layer("Instances_Particle", true);
sand_system = part_system_create_layer("Instances_SandParticle", true);

cloud = part_type_create();
part_type_shape(cloud, pt_shape_cloud);
part_type_size(cloud, 0.4, 0.6, 0, 0);
part_type_scale(cloud, 1, 1);
part_type_speed(cloud, 0.3, 0.6, 0, 0);
part_type_direction(cloud, 0, 360, 0, 0);
part_type_gravity(cloud, 0, 0);
part_type_orientation(cloud, 0, 360, 0, 0, false);
part_type_colour_mix(cloud, $d9d7cd, $b0ad99);
part_type_alpha2(cloud, 0.85, 0);
part_type_life(cloud, 10, 40);

player_fire = part_type_create();
part_type_shape(player_fire, pt_shape_pixel);
part_type_size(player_fire, 1, 1, 0, 0);
part_type_scale(player_fire, 1, 1);
part_type_speed(player_fire, 1, 2.5, 0, 0);
part_type_direction(player_fire, 70, 110, 0, 5);
part_type_gravity(player_fire, 0, 0);
part_type_orientation(player_fire, 0, 0, 0, 0, false);
part_type_colour3(player_fire, $2727a1, $7dced4, $8ddee4);
part_type_alpha3(player_fire, 1.0, 0.7, 0.0);
part_type_life(player_fire, 5, 12);

poison = part_type_create();
part_type_shape(poison, pt_shape_ring);
part_type_size(poison, 0.1, 0.2, 0, 0);
part_type_scale(poison, 1, 1);
part_type_speed(poison, 0.5, 1.0, 0, 0);
part_type_direction(poison, 45, 135, 0, 5);
part_type_gravity(poison, 0, 0);
part_type_orientation(poison, 0, 0, 0, 0, false);
part_type_colour_mix(poison, $f020a0, $d30094);
part_type_alpha2(poison, 0.5, 0);
part_type_life(poison, 24, 64);

player_sand = part_type_create();
part_type_shape(player_sand, pt_shape_pixel);
part_type_size(player_sand, 1, 1, 0, 0);
part_type_scale(player_sand, 1, 1);
part_type_speed(player_sand, 0.5, 4, 0, 0);
part_type_direction(player_sand, -5, 30, 0, 0);
part_type_gravity(player_sand, 0, 0);
part_type_orientation(player_sand, 0, 0, 0, 0, false);
part_type_colour_mix(player_sand, $00ffff, $60a4f4);
part_type_alpha1(player_sand, 0.5);
part_type_life(player_sand, 120, 240);
// TODO More background effects, and make the sand faster on later stages (it's more epic ^.^)

cloud_emitter = part_emitter_create(system);
sand_emitter = part_emitter_create(sand_system);
part_emitter_region(sand_system, sand_emitter, -128, room_width, 0, room_height, ps_shape_rectangle, ps_distr_linear);

sandyWinds = function() {
  part_emitter_burst(sand_system, sand_emitter, player_sand, 20);
}

puffOfClouds = function(xx, yy) {
  part_emitter_region(system, cloud_emitter, xx - 80, xx + 80, yy - 80, yy + 80, ps_shape_ellipse, ps_distr_linear);
  part_emitter_burst(system, cloud_emitter, cloud, 160);
}
