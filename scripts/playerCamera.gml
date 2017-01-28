///playerCamera()
//Handles the camera
//Call it in objMegaman

if prevx != noone and !instance_exists(objSectionSwitcher) and x > sectionLeft + view_wview[0]/2 and x < sectionRight - view_wview[0]/2 {
    diff = x - prevx;
    view_xview[0] += diff;
}
else {
    view_xview[0] = round(x - view_wview[0]/2);
}
prevx = x;


//Follow the player
view_yview[0] = round(y - view_hview[0]/2);


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
