/// Place room borders (left and right)
for (v = 0; v < room_height; v += view_hview) {
    instance_create(0, v, objSectionBorderLeftScreen);
    instance_create(room_width - 16, v, objSectionBorderRightScreen);
}  
