//getSections(startX, startY)
var startX = argument0;
var startY = argument1;

var q = ds_queue_create();

var s = sectionRect(startX, startY);
ds_queue_enqueue(q, s);

var sections = ds_map_create();

while !ds_queue_empty(q) {
    s = ds_queue_dequeue(q);
    ds_map_add(sections, s[? "id"], s);
    if s[? "path_top"] {
        var top_section = sectionRect(s[? "left"], s[? "top"] - 1);
        if !ds_map_exists(sections, top_section[? "id"]) {
            ds_queue_enqueue(q, top_section);
        }
    }
    if s[? "path_right"] {
        var right_section = sectionRect(s[? "right"] + 1, s[? "top"]);
        if !ds_map_exists(sections, right_section[? "id"]) {
            ds_queue_enqueue(q, right_section);
        }
    }
    if s[? "path_bottom"] {
        var bottom_section = sectionRect(s[? "left"], s[? "bottom"] + 1);
        if !ds_map_exists(sections, bottom_section[? "id"]) {
            ds_queue_enqueue(q, bottom_section);
        }
    }
    if s[? "path_left"] {
        var left_section = sectionRect(s[? "left"] - 1, s[? "top"]);
        if !ds_map_exists(sections, left_section[? "id"]) {
            ds_queue_enqueue(q, left_section);
        }
    }
}

ds_queue_destroy(q);

return sections;
