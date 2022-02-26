
system = part_system_create_layer("Instances_Particle", true);

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
part_type_life(player_fire, 10, 20);

cloud_emitter = part_emitter_create(system);

puffOfClouds = function(xx, yy) {
  part_emitter_region(system, cloud_emitter, xx - 80, xx + 80, yy - 80, yy + 80, ps_shape_ellipse, ps_distr_linear);
  part_emitter_burst(system, cloud_emitter, cloud, 160);
}
