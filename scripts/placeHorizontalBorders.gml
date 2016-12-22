/// Place horizontal borders (top and bottom)
for (v = 0; v < room_height; v += view_hview) {
    for (i = 0; i < room_width; i += view_wview) {
        instance_create(i, v, objSectionBorderTopScreen);
        instance_create(i, v + view_hview - 16, objSectionBorderBottomScreen);
        if v > 0 && v < room_height - 1 {
            for (var j = 0; j < view_wview; j += 16) {
                if instance_position(i + j, v, objLadder) {
                    instance_create(i + j, v, objSectionArrowUp);
                }
                if instance_position(i + j, v - 16, objLadder) {
                    instance_create(i + j, v - 16, objSectionArrowDown);
                }
            }            
        }
    }
}  
