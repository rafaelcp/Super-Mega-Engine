///playerGetHit(health)
//Call it like this: with objMegaman playerGetHit();
//Makes the player get hit

if canHit == true
{
    global._health -= argument0;
    
    canHit = false;
    isHit = true;
    hitTimer = 0;
    isStep = false;
    climbing = false;
    canGravity = true;
    isShoot = false;
    isThrow = false;
    onRushJet = false;
    
    //When sliding and there's a solid above us, we should not experience knockback
    //If we did, we would clip inside the ceiling above us
    if !(isSlide == true && (place_meeting(x, y-3, objSolid) || place_meeting(x, y-3, prtMovingPlatformSolid)))
    {
        canMove = false;
        canSpriteChange = false;
        isSlide = false;
        mask_index = mskMegaman;
        global.xspeed = image_xscale * -0.5;
        global.yspeed = 0;
        
        if global._health > 0
        {
            sprite_index = spriteHit;
            
            //Create sweat effects
            instance_create(sprite_get_xcenter()-11, sprite_get_ycenter()-17, objMegamanSweat);
            instance_create(sprite_get_xcenter(), sprite_get_ycenter()-17, objMegamanSweat);
            instance_create(sprite_get_xcenter()+11, sprite_get_ycenter()-17, objMegamanSweat);
        }
    }
    
    if global._health > 0
        playSFX(sfxHit);
}
