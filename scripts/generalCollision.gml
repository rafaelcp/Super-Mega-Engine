///generalCollision()
//Handles a general object's collision code. The object cannot have a specified mask. If it does, use generalCollisionMask()


//Floor
var mySolid;
mySolid = instance_place(x, y+yspeed, objSolid);
if mySolid >= 0 && yspeed > 0
{
    y = mySolid.y;
    while place_meeting(x, y, mySolid)
        y -= 1;
    ground = true;
    yspeed = 0;
}


//Wall
mySolid = instance_place(x+xspeed, y, objSolid);
if mySolid >= 0 && xspeed != 0
{    
    if xspeed < 0
        x = mySolid.x + 16 + (x - (bbox_left-1));
    else
        x = mySolid.x - (bbox_right+1 - x) - 1;
        
    xspeed = 0;
}


//Ceiling
mySolid = instance_place(x, y+yspeed, objSolid);
if mySolid >= 0 && yspeed < 0
{
    y = mySolid.y + 16 + (y - (bbox_top-1));
    yspeed = 0;
}


//Topsolids
mySolid = instance_place(x, y+yspeed, objTopSolid);
if mySolid >= 0 && yspeed > 0
{
    if !place_meeting(x, y, objTopSolid)
    {
        y = mySolid.y - (bbox_bottom+1 - y);
        ground = true;
        yspeed = 0;
    }
}


//Floor (moving platform)
var mySolid;
mySolid = instance_place(x, y+yspeed, prtMovingPlatformSolid);
if mySolid >= 0 && yspeed > 0
{
    if mySolid.object_index != objRushJet && mySolid.dead == false
    {
        y = mySolid.bbox_top;
        while place_meeting(x, y, mySolid)
            y -= 1;
        ground = true;
        yspeed = 0;
    }
}


//Wall (moving platform)
mySolid = instance_place(x+xspeed, y, prtMovingPlatformSolid);
if mySolid >= 0 && xspeed != 0
{    
    if mySolid.object_index != objRushJet && mySolid.dead == false
    {
        if xspeed < 0
            x = mySolid.bbox_right + (x - (bbox_left-1));
        else
            x = mySolid.bbox_left - (bbox_right+1 - x) - 1;
            
        xspeed = 0;
    }
}


//Ceiling (moving platform)
mySolid = instance_place(x, y+yspeed, prtMovingPlatformSolid);
if mySolid >= 0 && yspeed < 0
{
    if mySolid.object_index != objRushJet && mySolid.dead == false
    {
        y = mySolid.bbox_bottom + sprite_get_yoffset(sprite_index);
        yspeed = 0;
    }
}


//Topsolids (moving platform)
mySolid = instance_place(x, y+yspeed, prtMovingPlatformJumpthrough);
if mySolid >= 0 && yspeed > 0
{
    if mySolid.object_index != objRushJet && mySolid.dead == false
    {
        if !place_meeting(x, y, mySolid)
        {
            y = mySolid.bbox_top - (bbox_bottom+1 - y);
            ground = true;
            yspeed = 0;
        }
    }
}
