/// placeTileObjects()

var tiles = tile_get_ids();
var num_tiles = array_length_1d(tiles);
for (var i = 0; i < num_tiles; i++) {
    var type = tile_get_type(tiles[i], 0, 0);
    var obj = ds_map_find_value(global.tiles, type);
    if !is_undefined(obj) {
        var tx = tile_get_x(tiles[i]);
        var ty = tile_get_y(tiles[i]);  
        instance_create(tx, ty, obj);
    }
}
