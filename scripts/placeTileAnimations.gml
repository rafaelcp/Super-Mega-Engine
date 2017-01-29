/// placeTileAnimations()

var tiles = tile_get_ids();
var num_tiles = array_length_1d(tiles);

for (var i = 0; i < num_tiles; i++) {
    var tid = tiles[i];
    var tx = tile_get_x(tid);
    var ty = tile_get_y(tid);
    var real_tx = tile_get_x(tid);
    var real_ty = tile_get_y(tid);
    var tw = tile_get_width(tid);
    var th = tile_get_height(tid);
    var tile_id = tile_get_type(tid, tx - real_tx, ty - real_ty);
    var tiles_ = ds_map_find_value(global.anims, tile_id);
    if tiles_ > -1 {
        var key = ds_map_find_first(tiles_);
        while (!is_undefined(key)) {
            var tile = ds_map_find_value(tiles_, key);
            var parts = split(tile, ",");
            var bg = real(ds_queue_dequeue(parts));
            var tleft = real(ds_queue_dequeue(parts));
            var ttop = real(ds_queue_dequeue(parts));
            var tw_ = real(ds_queue_dequeue(parts));
            var th_ = real(ds_queue_dequeue(parts));
            tile_add(bg, tleft, ttop, tw_, th_, tx, ty, real(key));
            key = ds_map_find_next(tiles_, key);
        }
    }
}
