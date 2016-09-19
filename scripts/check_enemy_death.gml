//check_enemy_death()
if healthpoints <= 0 && object_get_parent(object_index) != prtBoss {
    instance_create(sprite_get_xcenter(), sprite_get_ycenter(), objItemExplosion);
}
