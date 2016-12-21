/// Place horizontal borders (top and bottom)
for (v = 0; v < room_height; v += view_hview) {
    for (i = 0; i < room_width; i += view_wview) {
        instance_create(i, v, objSectionBorderTopScreen);
        instance_create(i, v + view_hview - 16, objSectionBorderBottomScreen);
    }
}  
