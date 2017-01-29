/// placeTileObjects()

var tiles = tile_get_ids();
var num_tiles = array_length_1d(tiles);

for (var i = 0; i < num_tiles; i++) {
    var tid = tiles[i];
    var tx = tile_get_x(tid);
    var ty = tile_get_y(tid);
    var tw = tile_get_width(tid);
    var th = tile_get_height(tid);
    var type = tile_get_type(tid, 0, 0);
    var obj = ds_map_find_value(global.tiles, type);
    if !is_undefined(obj) {
        var inst = instance_create(tx, ty, obj);
        inst.image_xscale = tw / inst.sprite_width;
        inst.image_yscale = th / inst.sprite_height;
    }
}
