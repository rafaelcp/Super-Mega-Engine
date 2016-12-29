/// readTileObjects
// Must be called from rmInit

global.tiles = ds_map_create();

with all {
    var tile = tile_layer_find(1000000, x, y);
    if tile > -1 {
        var tx = tile_get_x(tile);
        var ty = tile_get_y(tile);
        var dx = x - tx;
        var dy = y - ty;
        var tile_id = tile_get_type(tile, dx, dy);
        ds_map_add(global.tiles, tile_id, object_index);
    }
}

