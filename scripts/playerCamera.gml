///playerCamera()
//Handles the camera
//Call it in prtPlayer

//Follow the player
view_xview[0] = round(x - view_wview[0] / 2);
view_yview[0] = round(y - view_hview[0] / 2);

//Stop at section borders
if view_xview[0] > sectionRight-view_wview[0]
    view_xview[0] = sectionRight-view_wview[0];
else if view_xview[0] < sectionLeft
    view_xview[0] = sectionLeft;
    
if view_yview[0] > sectionBottom-view_hview[0]
    view_yview[0] = sectionBottom-view_hview[0];
else if view_yview[0] < sectionTop
    view_yview[0] = sectionTop;
    
    
//Stop at room borders
if view_xview[0] > room_width-view_wview[0]
    view_xview[0] = room_width-view_wview[0];
else if view_xview[0] < 0
    view_xview[0] = 0;
    
if view_yview[0] > room_height-view_hview[0]
    view_yview[0] = room_height-view_hview[0];
else if view_yview[0] < 0
    view_yview[0] = 0;
