///playerSwitchSections()
//Moving from one section to the next, if possible

//newSectionXOffset/newSectionYOffset are used to get the right section borders in the new section
//Taking the normal X/Y coordinate would result in rounding errors in playerCameraInit(),
//which could either cause the game to freeze or the wrong section borders to be used
//Using 16 or 32 instead of 64 would also occassionally cause these problems, probably because of the +6/-6

if x > sectionRight-6 && place_meeting(x-global.xspeed+6, y, objSectionArrowRight) //Right
&& !collision_rectangle(sectionRight+1, bbox_top, sectionRight+2, bbox_bottom, objSolid, false, false)
{
    instance_activate_object(objSectionBorderLeft);
    instance_activate_object(objSectionBorderRight);
    instance_activate_object(objSectionBorderTop);
    instance_activate_object(objSectionBorderBottom);
    instance_activate_object(objSectionArrowLeft);
    instance_activate_object(objSectionArrowRight);
    instance_activate_object(objSectionArrowUp);
    instance_activate_object(objSectionArrowDown);
    newSectionXOffset = 64;
    
    if bbox_top <= view_yview[0]
        newSectionYOffset = 96;
    else if bbox_bottom >= view_yview[0]+view_hview[0]
        newSectionYOffset = -96;
    else
        newSectionYOffset = 0;
        
    alarm[1] = 1; //In GM Studio, the code in alarm 1 needs to be executed one frame later, else an error message will pop up
}
else if x < sectionLeft+6 && place_meeting(x-global.xspeed-6, y, objSectionArrowLeft) //Left
&& !collision_rectangle(sectionLeft-1, bbox_top, sectionLeft-2, bbox_bottom, objSolid, false, false)
{
    instance_activate_object(objSectionBorderLeft);
    instance_activate_object(objSectionBorderRight);
    instance_activate_object(objSectionBorderTop);
    instance_activate_object(objSectionBorderBottom);
    instance_activate_object(objSectionArrowLeft);
    instance_activate_object(objSectionArrowRight);
    instance_activate_object(objSectionArrowUp);
    instance_activate_object(objSectionArrowDown);
    newSectionXOffset = -64;
    
    if bbox_top <= view_yview[0]
        newSectionYOffset = 96;
    else if bbox_bottom >= view_yview[0]+view_hview[0]
        newSectionYOffset = -96;
    else
        newSectionYOffset = 0;
    
    alarm[1] = 1; //In GM Studio, the code in alarm 1 needs to be executed one frame later, else an error message will pop up
}
else if sprite_get_ycenter() > sectionBottom-6 && place_meeting(x, sprite_get_ycenter()-global.yspeed+6, objSectionArrowDown) //Down
&& !collision_rectangle(bbox_left+4, sectionBottom+1, bbox_right-4, sectionBottom+2, objSolid, false, false)
{
    instance_activate_object(objSectionBorderLeft);
    instance_activate_object(objSectionBorderRight);
    instance_activate_object(objSectionBorderTop);
    instance_activate_object(objSectionBorderBottom);
    instance_activate_object(objSectionArrowLeft);
    instance_activate_object(objSectionArrowRight);
    instance_activate_object(objSectionArrowUp);
    instance_activate_object(objSectionArrowDown);
    newSectionXOffset = 0;
    newSectionYOffset = 64;
    
    alarm[1] = 1; //In GM Studio, the code in alarm 1 needs to be executed one frame later, else an error message will pop up
}
else if sprite_get_ycenter() < sectionTop+6 && place_meeting(x, sprite_get_ycenter()-global.yspeed-6, objSectionArrowUp) //Up
&& (climbing == true || ground == true) && !collision_rectangle(bbox_left+4, sectionTop-1, bbox_right-4, sectionTop-2, objSolid, false, false)
{
    instance_activate_object(objSectionBorderLeft);
    instance_activate_object(objSectionBorderRight);
    instance_activate_object(objSectionBorderTop);
    instance_activate_object(objSectionBorderBottom);
    instance_activate_object(objSectionArrowLeft);
    instance_activate_object(objSectionArrowRight);
    instance_activate_object(objSectionArrowUp);
    instance_activate_object(objSectionArrowDown);
    newSectionXOffset = 0;
    newSectionYOffset = -64;
        
    alarm[1] = 1; //In GM Studio, the code in alarm 1 needs to be executed one frame later, else an error message will pop up
}
