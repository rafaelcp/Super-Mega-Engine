///playerGetHit(health)
//Call it like this: with prtPlayer playerGetHit();
//Makes the player get hit
assert(argument0 >= 0, "playerGetHit: Damage must be non-negative");

if canHit {
    drawDamageNumber(prtPlayer.x, prtPlayer.y, ceil(argument0 * damageMultiplier * global.damageMultiplier));
    global._health -= ceil(argument0 * damageMultiplier * global.damageMultiplier);
    
    canHit = false;
    isHit = true;
    hitTimer = 0;
    isStep = false;
    climbing = false;
    canGravity = true;
    isShoot = false;
    isThrow = false;
    onRushJet = false;
    
    if cfgLoseChargeOnHit {
        weapons[global.currentWeapon].chargeTimer = 0;
        weapons[global.currentWeapon].initChargeTimer = 0;
        with prtPlayer event_user(0); //Reset the colors
    }
    
    //When sliding and there's a solid above us, we should not experience knockback
    //If we did, we would clip inside the ceiling above us
    if !(isSlide && (place_meeting(x, y-3, objSolid) || place_meeting(x, y-3, prtMovingPlatformSolid))) {
        canMove = false;
        canSpriteChange = false;
        isSlide = false;
        mask_index = mskMegaman;
        global.xspeed = image_xscale * -knockbackAmount;
        global.yspeed = 0;
        
        if global._health > 0 {
            sprite_index = spriteHit;
            
            //Create sweat effects
            instance_create(sprite_get_xcenter()-11, sprite_get_ycenter()-17, objMegamanSweat);
            instance_create(sprite_get_xcenter(), sprite_get_ycenter()-17, objMegamanSweat);
            instance_create(sprite_get_xcenter()+11, sprite_get_ycenter()-17, objMegamanSweat);
        }
    }
    
    if global._health > 0 {
        playSFX(sfxHit);
    }
}
