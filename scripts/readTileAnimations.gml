/// readTileAnimations
// Must be called from rmInit

global.anims = ds_map_create();

for (var tx = 0; tx < room_width; tx += 16) {
    for (var ty = 0; ty < room_height; ty += 16) {
        var tid = tile_layer_find(1000000, tx, ty);
        if tid > -1 {
            var real_tx = tile_get_x(tid);
            var real_ty = tile_get_y(tid);
            var tile_id = tile_get_type(tid, tx - real_tx, ty - real_ty);
            var anim = ds_map_create();
            //print(i, tx, ty, tile_id);
            for (var l = global.ini_layer; l >= global.end_layer; l--) {
                var tid_ = tile_layer_find(l, tx, ty);
                //print(l, tx, ty);
                if tid_ > -1 {
                    var real_tx_ = tile_get_x(tid_);
                    var real_ty_ = tile_get_y(tid_);
                    var tile_id_ = tile_get_type(tid_, tx - real_tx_, ty - real_ty_);
                    ds_map_add(anim, l, tile_id_);
                    //print(i, tile_id, l, tile_id_);
                }
            }
            if ds_map_size(anim) > 0 {
                ds_map_add(global.anims, tile_id, anim);
            }
        }
    }
}
