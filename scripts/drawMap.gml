//drawMap(roomid, scale, startX, startY)
var roomid = argument0;
var scale = argument1;
var oldroom = room;
if oldroom != roomid {
    room_goto(roomid);
}

if instance_exists(objMegaman) {
    var startX = objMegaman.x;
    var startY = objMegaman.y;
}
else {
    var startX = argument2;
    var startY = argument3;
}
var surf = surface_create(room_width * scale + 4, room_height * scale + 4);
surface_set_target(surf);
draw_clear_alpha(c_black, 0);

var sections = getSections(startX, startY);
var init_section = sectionRect(startX, startY);

var curr_section_id = ds_map_find_first(sections);

while !is_undefined(curr_section_id) {
    var curr_section = sections[? curr_section_id];
    var neighbors = sectionNeighbors(curr_section);
    var curr_id = ds_map_find_first(neighbors);
    while !is_undefined(curr_id) {
        var neighbor = neighbors[? curr_id];
        //draw_set_colour(c_black);
        //draw_line_width(round(curr_section[? "center"] * scale), round(curr_section[? "middle"] * scale), round(neighbor[? "center"] * scale), round(neighbor[? "middle"] * scale), 4);
        draw_set_colour(c_white);
        draw_line_width(round(curr_section[? "center"] * scale), round(curr_section[? "middle"] * scale), round(neighbor[? "center"] * scale), round(neighbor[? "middle"] * scale), 2);
        if instanceInside(neighbor[? "left"], neighbor[? "top"], neighbor[? "right"], neighbor[? "bottom"], objBossControl) {
            draw_set_colour(c_red);
            draw_circle(round(neighbor[? "center"] * scale), round(neighbor[? "middle"] * scale), 3, c_black);
        }
        curr_id = ds_map_find_next(neighbors, curr_id);
    }
    curr_section_id = ds_map_find_next(sections, curr_section_id);
}
draw_set_colour(c_red);
draw_circle(round(init_section[? "center"] * scale), round(init_section[? "middle"] * scale), 3, c_black);
surface_reset_target();


if oldroom != roomid {
    room_goto(oldroom);
}


return surf;
