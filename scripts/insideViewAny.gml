/// insideViewAny(obj)
//Returns an object if any object of this type is inside the view, and -1 otherwise
//This script only works for view 0

var obj = argument0;

with obj {
    if sprite_get_xcenter() >= view_xview[0] && sprite_get_xcenter() < view_xview[0]+view_wview[0]
    && sprite_get_ycenter() >= view_yview[0] && sprite_get_ycenter() < view_yview[0]+view_hview[0]
        return self;
}
return -1;
