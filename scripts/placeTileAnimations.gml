/// placeTileAnimations()

for (var tx = 0; tx < room_width; tx += 16) {
    for (var ty = 0; ty < room_height; ty += 16) {
        var tid = tile_layer_find(1000000, tx, ty);
        if tid > -1 {
            var real_tx = tile_get_x(tid);
            var real_ty = tile_get_y(tid);
            var tile_id = tile_get_type(tid, tx - real_tx, ty - real_ty);
            var tiles = ds_map_find_value(global.anims, tile_id);
            if tiles > -1 {
                var key = ds_map_find_first(tiles);
                while (!is_undefined(key)) {
                    var tile = ds_map_find_value(tiles, key);
                    var parts = split(tile, ",");
                    var bg = real(ds_queue_dequeue(parts));
                    var tleft = real(ds_queue_dequeue(parts));
                    var ttop = real(ds_queue_dequeue(parts));
                    //print(bg, tleft, ttop, key);
                    tile_add(bg, tleft, ttop, 16, 16, tx, ty, real(key));
                    key = ds_map_find_next(tiles, key);
                }
            }
        }
    }
}
