/// readTileAnimations
// Must be called from rmInit

global.anims = ds_map_create();

var tiles = tile_get_ids();
var num_tiles = array_length_1d(tiles);

for (var i = 0; i < num_tiles; i++) {
    var tid = tiles[i];
    var tl = tile_get_depth(tid);
    if tl == 1000000 {
        continue;
    }
    var tx = tile_get_x(tid);
    var ty = tile_get_y(tid);
    var tw = tile_get_width(tid);
    var th = tile_get_height(tid);
    var tile_id = tile_get_type(tid, 0, 0);
    for (var j = 0; j < num_tiles; j++) {
        var tid_ = tiles[j];
        var tl_ = tile_get_depth(tid_);
        if tl_ != 1000000 {
            continue;
        }        
        var tx_ = tile_get_x(tid_);
        var ty_ = tile_get_y(tid_);
        var tw_ = tile_get_width(tid_);
        var th_ = tile_get_height(tid_);
        if tx > tx_ + tw_ or ty > ty_ + th_ or tx < tx_ or ty < ty_ {
            continue;
        }
        var tile_id_ = tile_get_type(tid_, tx - tx_, ty - ty_);
        //print(tile_id, tile_id_, tx, tx_, ty, ty_);
        var anim = ds_map_find_value(global.anims, tile_id_);
        if is_undefined(anim) {
            anim = ds_map_create();
        }
        ds_map_add(anim, tl, tile_id + "," + string(tw) + "," + string(th));
        ds_map_add(global.anims, tile_id_, anim);
    }
}
