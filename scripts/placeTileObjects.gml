/// placeTileObjects()

for (var tx = 0; tx < room_width; tx += 16) {
    for (var ty = 0; ty < room_height; ty += 16) {
        var tid = tile_layer_find(1000000, tx, ty);
        if tid > -1 {
            var real_tx = tile_get_x(tid);
            var real_ty = tile_get_y(tid);
            var type = tile_get_type(tid, tx - real_tx, ty - real_ty);
            var obj = ds_map_find_value(global.tiles, type);
            if !is_undefined(obj) {
                instance_create(tx, ty, obj);
            }
        }
    }
}
