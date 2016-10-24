//sectionRect(posx,posy)
var posx = argument0;
var posy = argument1;

var currx = posx;
var curry = posy;
var left = -999;
while left == -999 {
    if currx <= 15 {
        left = 0;
    }
    var bsid = instance_position(currx, curry, objSectionBorderLeftScreen);
    if bsid > -1 {
        left = bsid.x;
    }
    var bid = instance_position(currx, curry, objSectionBorderLeft);
    if bid > -1 {
        left = bid.x;
    }
    currx--;
}

//show_debug_message("Left: " + string(left));

currx = posx;
curry = posy;
var right = -999;
while right == -999 {
    if currx >= room_width-16 {
        right = room_width-1;
    }
    var bsid = instance_position(currx, curry, objSectionBorderRightScreen);
    if bsid > -1 {
        right = bsid.x + 15;
    }
    var bid = instance_position(currx, curry, objSectionBorderRight);
    if bid > -1 {
        right = bid.x + 15;
    }
    currx++;
}

//show_debug_message("Right: " + string(right));

currx = posx;
curry = posy;
var top = -999;
while top == -999 {
    if curry <= 15 {
        top = 0;
    }
    var bsid = instance_position(currx, curry, objSectionBorderTopScreen);
    if bsid > -1 {
        top = bsid.y;
    }
    var bid = instance_position(currx, curry, objSectionBorderTop);
    if bid > -1 {
        top = bid.y;
    }
    curry--;
}

//show_debug_message("Top: " + string(top));

currx = posx;
curry = posy;
var bottom = -999;
while bottom == -999 {
    if curry >= room_height-16 {
        bottom = room_height-1;
    }
    var bsid = instance_position(currx, curry, objSectionBorderBottomScreen);
    if bsid > -1 {
        bottom = bsid.y + 15;
    }
    var bid = instance_position(currx, curry, objSectionBorderBottom);
    if bid > -1 {
        bottom = bid.y + 15;
    }
    curry++;
}

var center = (left + right) / 2;
var middle = (top + bottom) / 2;

//show_debug_message("Bottom: " + string(bottom));

var rect = ds_map_create();
ds_map_add(rect, "left", left);
ds_map_add(rect, "right", right);
ds_map_add(rect, "top", top);
ds_map_add(rect, "bottom", bottom);
ds_map_add(rect, "width", right - left + 1);
ds_map_add(rect, "height", bottom - top + 1);
ds_map_add(rect, "center", center);
ds_map_add(rect, "middle", middle);
ds_map_add(rect, "id", string(left) + "," +  string(top) );

ds_map_add(rect, "path_top", instanceInside(left, top, right, bottom, objSectionArrowUp) > -1 || instanceInside(left, top - 17, right, middle, objBossDoorH) > -1);    
ds_map_add(rect, "path_right", instanceInside(left, top, right, bottom, objSectionArrowRight) > -1 || instanceInside(center, top, right, bottom, objBossDoor) > -1);    
ds_map_add(rect, "path_bottom", instanceInside(left, top, right, bottom, objSectionArrowDown) > -1 || instanceInside(left, middle, right, bottom, objBossDoorH) > -1);    
ds_map_add(rect, "path_left", instanceInside(left, top, right, bottom, objSectionArrowLeft) > -1 || instanceInside(left - 17, top, center, bottom, objBossDoor) > -1);    

return rect;
