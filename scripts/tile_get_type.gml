/// tile_get_type(id, dx, dy)

var tid = argument0;
var dx = argument1;
var dy = argument2;

var tbg = tile_get_background(tid);
var tleft = tile_get_left(tid) + dx;
var ttop = tile_get_top(tid) + dy;
var tile_id = string(tbg) + "," + string(tleft) + "," + string(ttop);

return tile_id;

