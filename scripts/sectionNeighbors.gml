//sectionNeighbors(sectionRect)
var section = argument0;
var neighbors = ds_map_create();

if section[? "path_top"] {
    var rect = sectionRect(section[? "left"], section[? "top"] - 1);
    ds_map_add(neighbors, "top", rect);
}

if section[? "path_right"] {
    var rect = sectionRect(section[? "right"] + 1, section[? "top"]);
    ds_map_add(neighbors, "right", rect);
}

if section[? "path_bottom"] {
    var rect = sectionRect(section[? "left"], section[? "bottom"] + 1);
    ds_map_add(neighbors, "bottom", rect);
}

if section[? "path_left"] {
    var rect = sectionRect(section[? "left"] - 1, section[? "top"]);
    ds_map_add(neighbors, "left", rect);
}

return neighbors;
