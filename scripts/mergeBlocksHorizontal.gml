/// mergeBlocksHorizontal(type)
var type = argument0;
var next;

with type {
    if instance_exists(self) {
        next = instance_position(x + sprite_width, y, type);
        while(next > - 1 && image_yscale == next.image_yscale && object_index == next.object_index && object_get_parent(next.object_index) != prtDestructibleBlock) {
            image_xscale += next.image_xscale;
            with next instance_destroy();
            next = instance_position(x + sprite_width, y, type);
        }
    }
}
