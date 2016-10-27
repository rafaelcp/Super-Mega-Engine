///playerMovingPlatform()
//Handles moving platform collision


//Jumpthrough moving platforms
mySolid = instance_place(x, y+global.yspeed, prtMovingPlatformJumpthrough);
if mySolid >= 0 && global.yspeed > 0
{
    if mySolid.dead == false
    {
        if !place_meeting(x, y, mySolid)
        {
            y = mySolid.bbox_top - (sprite_get_height(mask_index) - sprite_get_yoffset(mask_index));
            ground = true;
            global.yspeed = 0;
            
            if playLandSound == true
                playSFX(sfxLand);
        }
    }
}


//Floor (moving platforms)
mySolid = instance_place(x, y+global.yspeed, prtMovingPlatformSolid);
if mySolid >= 0 /*&& global.yspeed >= 0*/ && !place_meeting(x, y, mySolid)
&& collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom+global.yspeed+1, mySolid, false, false)
{
    if mySolid.dead == false
    {
        y = mySolid.bbox_top - (sprite_get_height(mask_index) - sprite_get_yoffset(mask_index));
        ground = true;
        global.yspeed = 0;
        
        if playLandSound == true
            playSFX(sfxLand);
            
        
        //Note: there used to be a system here that set MM's sprite to the walking sprite when landing
        //However, due to complications such as climbing up ladders, it was a lot of work for such a minor feature
        //Therefore, it has been removed
    }
}


//Wall (moving platforms)
mySolid = instance_place(x+global.xspeed, y, prtMovingPlatformSolid);
if mySolid >= 0 && global.xspeed != 0 && !collision_rectangle(bbox_left+4, bbox_bottom, bbox_right-4, bbox_bottom+3, mySolid, false, false)
{
    if mySolid.dead == false
    {
        if global.xspeed < 0 && mySolid.xspeed >= 0
            x = mySolid.bbox_right + sprite_get_xoffset(mask_index) - sprite_get_bbox_left(mask_index) + 1;
        else if mySolid.xspeed <= 0
            x = mySolid.bbox_left - (sprite_get_width(mask_index) - sprite_get_xoffset(mask_index)) + (sprite_get_width(mask_index) - sprite_get_bbox_right(mask_index)) - 1;
            
        global.xspeed = 0;
    }
}


//Ceiling (moving platforms)
mySolid = instance_place(x, y+global.yspeed+sign(global.yspeed), prtMovingPlatformSolid);
if mySolid >= 0 && global.yspeed < 0 && !place_meeting(x, y, mySolid)
{
    if mySolid.dead == false
    {
        y = mySolid.bbox_bottom + sprite_get_yoffset(mask_index);
        global.yspeed = mySolid.yspeed;
    }
}
