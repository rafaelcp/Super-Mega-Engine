///playerShoot()
//Handles Mega Man's shooting


var box, yy, attackID;
if image_xscale == 1
    box = bbox_right+6;
else
    box = bbox_left-6;
    
switch sprite_index
{
    case spriteStand: yy = y+4; break;
    case spriteStep: yy = y+4; break;
    case spriteWalk: yy = y+4; break;
    case spriteJump: yy = y+3; break;
    case spriteClimb: yy = y+4; break;
    default: yy = y+4; break;
}


//Shooting
if global.keyShootPressed && canShoot == true && (canMove == true || climbing == true || isThrow == true || onRushJet == true)
&& instance_number(objBusterShotCharged) < 1 && global.ammo[global.currentWeapon] > 0
{   
    if climbing == true
    {
        image_xscale = climbShootXscale;
        
        if image_xscale == 1
            box = bbox_right;
        else
            box = bbox_left;
    }
            
    
    switch global.weapon
    {
        case megabuster:
            if instance_number(objBusterShot) + instance_number(objBusterShotHalfCharged) + instance_number(objReflectedProjectile) < 3
            {
                attackID = instance_create(box+image_xscale*4, yy, objBusterShot);
                    attackID.xspeed = image_xscale * 5;
                playSFX(sfxBuster);
                isShoot = true;
                shootTimer = 0;
            }
        break;
        
        case silvertomahawk:
            if instance_number(objSilverTomahawk) + instance_number(objReflectedProjectile) < 2
            {
                attackID = instance_create(box+image_xscale*12, yy, objSilverTomahawk);
                    attackID.xspeed = image_xscale * 3.5;
                playSFX(sfxBuster);
                isShoot = true;
                shootTimer = 0;
                
                global.ammo[global.currentWeapon] -= global.weaponAmmo[global.weaponSlot[global.currentWeapon]];
                if global.ammo[global.currentWeapon] <= 0
                    global.ammo[global.currentWeapon] = 0;
            }
        break;
        
        case windstorm:
            if instance_number(objWindStorm) + instance_number(objReflectedProjectile) < 3
            {
                attackID = instance_create(box+image_xscale*9, yy, objWindStorm);
                    attackID.xspeed = image_xscale * 3;
                    attackID.image_xscale = image_xscale;
                playSFX(sfxBuster);
                isShoot = true;
                shootTimer = 0;
                
                global.ammo[global.currentWeapon] -= global.weaponAmmo[global.weaponSlot[global.currentWeapon]];
                if global.ammo[global.currentWeapon] <= 0
                    global.ammo[global.currentWeapon] = 0;
            }
        break;
        
        case pharaohshot:
            if instance_number(objPharaohShot) + instance_number(objReflectedProjectile) < 3
            {
                attackID = instance_create(box+image_xscale*4, yy, objPharaohShot);
                    attackID.xspeed = image_xscale * 4.5;
                    
                if global.keyUp && !global.keyDown
                    attackID.yspeed = -4.5;
                else if global.keyDown && !global.keyUp
                    attackID.yspeed = 4.5;
                else
                    attackID.yspeed = 0;
                    
                playSFX(sfxPharaohShot);
                isThrow = true;
                shootTimer = 0;
                
                global.ammo[global.currentWeapon] -= global.weaponAmmo[global.weaponSlot[global.currentWeapon]];
                if global.ammo[global.currentWeapon] <= 0
                    global.ammo[global.currentWeapon] = 0;
            }
        break;
        
        case metalblade:
            if instance_number(objMetalBlade) + instance_number(objReflectedProjectile) < 3
            {
                attackID = instance_create(x+image_xscale*3, yy, objMetalBlade);
                    
                if global.keyRight && !global.keyLeft && global.keyUp
                    attackID.dir = 45;
                else if global.keyLeft && !global.keyRight && global.keyUp
                    attackID.dir = 135;
                else if global.keyLeft && !global.keyRight && global.keyDown
                    attackID.dir = 225;
                else if global.keyRight && !global.keyLeft && global.keyDown
                    attackID.dir = 315;
                else if global.keyUp
                    attackID.dir = 90;
                else if global.keyDown
                    attackID.dir = 270;
                else
                {
                    if image_xscale == -1
                        attackID.dir = 180;
                    else
                        attackID.dir = 0;
                }
                    
                playSFX(sfxMetalBlade);
                isThrow = true;
                shootTimer = 0;
                
                global.ammo[global.currentWeapon] -= global.weaponAmmo[global.weaponSlot[global.currentWeapon]];
                if global.ammo[global.currentWeapon] <= 0
                    global.ammo[global.currentWeapon] = 0;
            }
        break;
        
        case starcrash:
            if instance_number(objStarCrash) + instance_number(objReflectedProjectile) < 1
            {
                attackID = instance_create(x, sprite_get_ycenter(), objStarCrash);
            }
        break;
        
        case rushcoil:
            if instance_number(objRushCoil) < 1
            {
                var tpY, airIncrease;
                tpY = 0;
                if ground == true
                    airIncrease = 0;
                else
                    airIncrease = 20; //When in the air, the upwards range is reduced because Rush could otherwise spawn above ceilings
                
                
                while !(!position_meeting(x+image_xscale*26, sprite_get_ycenter()-tpY-1 + airIncrease, objSolid) && !position_meeting(x+image_xscale*26, sprite_get_ycenter()-tpY-1 + airIncrease, prtMovingPlatformSolid)
                && !position_meeting(x+image_xscale*26, sprite_get_ycenter()-tpY-1 + airIncrease, objTopSolid) && !position_meeting(x+image_xscale*26, sprite_get_ycenter()-tpY-1 + airIncrease, prtMovingPlatformJumpthrough)
                && (position_meeting(x+image_xscale*26, sprite_get_ycenter()-tpY + airIncrease, objSolid) || position_meeting(x+image_xscale*26, sprite_get_ycenter()-tpY + airIncrease, prtMovingPlatformSolid)
                || position_meeting(x+image_xscale*26, sprite_get_ycenter()-tpY + airIncrease, objTopSolid) || position_meeting(x+image_xscale*26, sprite_get_ycenter()-tpY + airIncrease, prtMovingPlatformJumpthrough)))
                && !(position_meeting(x+image_xscale*26, sprite_get_ycenter()+tpY, objSolid) && tpY > sprite_get_height(mask_index)/2)
                && !(position_meeting(x+image_xscale*26, sprite_get_ycenter()+tpY, prtMovingPlatformSolid) && tpY > sprite_get_height(mask_index)/2)
                && !(position_meeting(x+image_xscale*26, sprite_get_ycenter()+tpY, objTopSolid) && tpY > sprite_get_height(mask_index)/2)
                && !(position_meeting(x+image_xscale*26, sprite_get_ycenter()+tpY, prtMovingPlatformJumpthrough) && tpY > sprite_get_height(mask_index)/2)
                && !position_meeting(x+image_xscale*26, sprite_get_ycenter()+tpY, objBossDoor)
                && tpY <= 12+52
                {
                    tpY += 1;
                }
                
                if position_meeting(x+image_xscale*26, sprite_get_ycenter()+tpY, objSolid)
                || position_meeting(x+image_xscale*26, sprite_get_ycenter()+tpY, prtMovingPlatformSolid)
                || position_meeting(x+image_xscale*26, sprite_get_ycenter()+tpY, objTopSolid)
                || position_meeting(x+image_xscale*26, sprite_get_ycenter()+tpY, prtMovingPlatformJumpthrough)
                {
                    if position_meeting(x+image_xscale*26, sprite_get_ycenter()+tpY, objSolid)
                    {
                        var solidID;
                        solidID = instance_position(x+image_xscale*26, sprite_get_ycenter()+tpY, objSolid);
                        attackID = instance_create(x+image_xscale*26, solidID.y-16, objRushCoil);
                            attackID.shouldLand = true;
                            attackID.image_xscale = image_xscale;
                    }
                    else if position_meeting(x+image_xscale*26, sprite_get_ycenter()+tpY, prtMovingPlatformSolid)
                    {
                        var solidID;
                        solidID = instance_position(x+image_xscale*26, sprite_get_ycenter()+tpY, prtMovingPlatformSolid);
                        attackID = instance_create(x+image_xscale*26, solidID.bbox_top-16, objRushCoil);
                            attackID.shouldLand = true;
                            attackID.image_xscale = image_xscale;
                    }
                    else if position_meeting(x+image_xscale*26, sprite_get_ycenter()+tpY, objTopSolid)
                    {
                        var solidID;
                        solidID = instance_position(x+image_xscale*26, sprite_get_ycenter()+tpY, objTopSolid);
                        attackID = instance_create(x+image_xscale*26, solidID.y-16, objRushCoil);
                            attackID.shouldLand = true;
                            attackID.image_xscale = image_xscale;
                    }
                    else
                    {
                        var solidID;
                        solidID = instance_position(x+image_xscale*26, sprite_get_ycenter()+tpY, prtMovingPlatformJumpthrough);
                        attackID = instance_create(x+image_xscale*26, solidID.bbox_top-16, objRushCoil);
                            attackID.shouldLand = true;
                            attackID.image_xscale = image_xscale;
                    }
                }
                else if !position_meeting(x+image_xscale*26, sprite_get_ycenter()-tpY-1 + airIncrease, objSolid)
                && !position_meeting(x+image_xscale*26, sprite_get_ycenter()-tpY-1 + airIncrease, prtMovingPlatformSolid)
                && !position_meeting(x+image_xscale*26, sprite_get_ycenter()-tpY-1 + airIncrease, objTopSolid)
                && !position_meeting(x+image_xscale*26, sprite_get_ycenter()-tpY-1 + airIncrease, prtMovingPlatformJumpthrough)
                && !position_meeting(x+image_xscale*26, sprite_get_ycenter()-tpY-1 + airIncrease, objBossDoor)
                && (position_meeting(x+image_xscale*26, sprite_get_ycenter()-tpY + airIncrease, objSolid) || position_meeting(x+image_xscale*26, sprite_get_ycenter()-tpY + airIncrease, prtMovingPlatformSolid)
                || position_meeting(x+image_xscale*26, sprite_get_ycenter()-tpY + airIncrease, objTopSolid) || position_meeting(x+image_xscale*26, sprite_get_ycenter()-tpY + airIncrease, prtMovingPlatformJumpthrough))
                {
                    if position_meeting(x+image_xscale*26, sprite_get_ycenter()-tpY + airIncrease, objSolid)
                    {
                        var solidID;
                        solidID = instance_position(x+image_xscale*26, sprite_get_ycenter()-tpY + airIncrease, objSolid);
                        attackID = instance_create(x+image_xscale*26, solidID.y-16, objRushCoil);
                            attackID.shouldLand = true;
                            attackID.image_xscale = image_xscale;
                    }
                    else if position_meeting(x+image_xscale*26, sprite_get_ycenter()-tpY + airIncrease, prtMovingPlatformSolid)
                    {
                        var solidID;
                        solidID = instance_position(x+image_xscale*26, sprite_get_ycenter()-tpY + airIncrease, prtMovingPlatformSolid);
                        attackID = instance_create(x+image_xscale*26, solidID.bbox_top-16, objRushCoil);
                            attackID.shouldLand = true;
                            attackID.image_xscale = image_xscale;
                    }
                    else if position_meeting(x+image_xscale*26, sprite_get_ycenter()-tpY + airIncrease, objTopSolid)
                    {
                        var solidID;
                        solidID = instance_position(x+image_xscale*26, sprite_get_ycenter()-tpY + airIncrease, objTopSolid);
                        attackID = instance_create(x+image_xscale*26, solidID.y-16, objRushCoil);
                            attackID.shouldLand = true;
                            attackID.image_xscale = image_xscale;
                    }
                    else
                    {
                        var solidID;
                        solidID = instance_position(x+image_xscale*26, sprite_get_ycenter()-tpY + airIncrease, prtMovingPlatformJumpthrough);
                        attackID = instance_create(x+image_xscale*26, solidID.bbox_top-16, objRushCoil);
                            attackID.shouldLand = true;
                            attackID.image_xscale = image_xscale;
                    }
                }
                else
                {
                    attackID = instance_create(x+image_xscale*26, sprite_get_ycenter(), objRushCoil);
                        attackID.shouldLand = false;
                        attackID.image_xscale = image_xscale;
                }
            }
            else
            {
                if instance_number(objBusterShot) + instance_number(objBusterShotHalfCharged) + instance_number(objReflectedProjectile) < 3
                {
                    attackID = instance_create(box+image_xscale*4, yy, objBusterShot);
                        attackID.xspeed = image_xscale * 5;
                    playSFX(sfxBuster);
                    isShoot = true;
                    shootTimer = 0;
                }
            }
        break;
        
        case rushjet:
            if instance_number(objRushJet) < 1
            {
                attackID = instance_create(x+image_xscale*26, sprite_get_ycenter()-8, objRushJet);
                        attackID.image_xscale = image_xscale;
            }
            else
            {
                if instance_number(objBusterShot) + instance_number(objBusterShotHalfCharged) + instance_number(objReflectedProjectile) < 3
                {
                    attackID = instance_create(box+image_xscale*4, yy, objBusterShot);
                        attackID.xspeed = image_xscale * 5;
                    playSFX(sfxBuster);
                    isShoot = true;
                    shootTimer = 0;
                }
            }
        break;
        
        case centaurflash:
            if instance_number(objCentaurFlash) < 1 {
                attackID = instance_create(x, sprite_get_ycenter(), objCentaurFlash);
                global.ammo[global.currentWeapon] -= global.weaponAmmo[global.weaponSlot[global.currentWeapon]];
                if global.ammo[global.currentWeapon] <= 0
                    global.ammo[global.currentWeapon] = 0;
                isShoot = true;
                shootTimer = 0;                    
            }
        break;
    }
}


//While shooting
if isShoot == true
{
    isThrow = false;
    shootTimer += 1;
    if shootTimer >= 20
    {
        isShoot = false;
    }
}
else if isThrow == true //Throwing weapons, like Pharaoh Shot and Metal Blade
{
    isShoot = false;
    
    //To allow shooting in the opposite direction
    if global.keyShootPressed
    {
        if global.keyRight && !global.keyLeft
            image_xscale = 1;
        else if global.keyLeft && !global.keyRight
            image_xscale = -1;
    }
    
    if ground == true && shootTimer == 0 && climbing == false //Only do this on the ground on the first frame
    {
        canMove = false;
        global.xspeed = 0;
        canSpriteChange = false;
        playerHandleSprites(); //We need to call this script because between throwing and checking throwing, it isn't executed and the wrong sprite would display
        sprite_index = spriteStand;
        shootTimer = 5; //20 frames is too much to be frozen for. However, when not frozen, 20 frames looks better
    }
    
    if ground == false && climbing == false
    {
        canMove = true;
        canSpriteChange = true;
    }
    
    shootTimer += 1;
    if shootTimer >= 20
    {
        isThrow = false;
        if ground == true
        {
            canMove = true;
            canSpriteChange = true;
        }
    }
}


//Charging
if global.enableCharge == true
{
    if global.weapon == megabuster && (global.keyShoot || (isSlide == true && chargeTimer != 0))
    {
        if (canMove == true || isSlide == true || climbing == true) && isShoot == false
        {
            isCharge = true;
            
            if isSlide == false
                initChargeTimer += 1;
                
            if initChargeTimer >= initChargeTime
            {
                chargeTimer += 1;
                
                if chargeTimer == 1
                    playSFX(sfxCharging);
                
                if chargeTimer < chargeTime
                {
                    var chargeTimeDiv, chargeCol;
                    chargeTimeDiv = round(chargeTime / 3);
                    if chargeTimer < chargeTimeDiv
                        chargeCol = make_color_rgb(168, 0, 32);     //Dark red
                    else if chargeTimer < chargeTimeDiv * 2
                        chargeCol = make_color_rgb(228, 0, 88);     //Red (dark pink)
                    else
                        chargeCol = make_color_rgb(248, 88, 152);   //Light red (pink)
                        
                    if chargeTimer mod 4 == 0 || chargeTimer mod 4 == 1
                        global.outlineCol = chargeCol;
                    else
                        global.outlineCol = c_black;
                }
                else
                {
                    if chargeTimer == chargeTime
                    {
                        stopSFX(sfxCharging);
                        playSFX(sfxCharged);
                    }
                    
                    switch (chargeTimer/2 mod 3)
                    {
                        case 0: //Light blue helmet, black shirt, blue outline
                            global.primaryCol = make_color_rgb(0, 232, 216);
                            global.secondaryCol = c_black;
                            global.outlineCol = make_color_rgb(0, 120, 248);
                        break;
                        
                        case 1: //Black helmet, blue shirt, light blue outline
                            global.primaryCol = c_black;
                            global.secondaryCol = make_color_rgb(0, 120, 248);
                            global.outlineCol = make_color_rgb(0, 232, 216);
                        break;
                        
                        case 2: //Blue helmet, light blue shirt, blue outline
                            global.primaryCol = make_color_rgb(0, 120, 248);
                            global.secondaryCol = make_color_rgb(0, 232, 216);
                            global.outlineCol = c_black;
                        break;
                    }
                }
            }
        }
    }
    else if global.weapon == megabuster && !global.keyShoot      //Release the charge shot
    {
        if (canMove == true || climbing == true) && chargeTimer != 0
        {
            isShoot = true;
            shootTimer = 0;
            
            if climbing == true
            {
                image_xscale = climbShootXscale;
                
                if image_xscale == 1
                    box = bbox_right;
                else
                    box = bbox_left;
            }
        
            if chargeTimer < chargeTime
            {
                attackID = instance_create(box+image_xscale*6, yy, objBusterShotHalfCharged);
                    attackID.xspeed = image_xscale * 5;
                    attackID.image_xscale = image_xscale;
                playSFX(sfxBusterHalfCharged);
            }
            else
            {
                attackID = instance_create(box+image_xscale*14, yy, objBusterShotCharged);
                    attackID.xspeed = image_xscale * 5.5;
                    attackID.image_xscale = image_xscale;
                playSFX(sfxBusterCharged);
            }
            
            chargeTimer = 0;
            initChargeTimer = 0;
            stopSFX(sfxCharged);
            stopSFX(sfxCharging);
            event_user(0); //Reset the colors
        } 
    }
}


//Charging the Pharaoh Shot
if global.weapon == pharaohshot && global.ammo[global.currentWeapon] > 0
{
    if global.keyShoot && !instance_exists(objPharaohShotCharging)
    {
        pharaohShotInitTimer += 1;
        if pharaohShotInitTimer >= 30
        {
            instance_create(x + image_xscale, y-20, objPharaohShotCharging);
            pharaohShotInitTimer = 0;
        }
    }
    else if !global.keyShoot && instance_exists(objPharaohShotCharging)
    {
        if (canMove == true || climbing == true)
        {
            if climbing == true
            {
                image_xscale = climbShootXscale;
            }
            
            if objPharaohShotCharging.sprite_index == sprPharaohShotCharging //Small shot
            {
                attackID = instance_create(box+image_xscale*4, yy, objPharaohShot);
                    attackID.xspeed = image_xscale * 4.5;
                    
                if global.keyUp && !global.keyDown
                    attackID.yspeed = -4.5;
                else if global.keyDown && !global.keyUp
                    attackID.yspeed = 4.5;
                else
                    attackID.yspeed = 0;
                    
                playSFX(sfxPharaohShot);
                isThrow = true;
                shootTimer = 0;
                
                global.ammo[global.currentWeapon] -= global.weaponAmmo[global.weaponSlot[global.currentWeapon]];
                if global.ammo[global.currentWeapon] <= 0
                    global.ammo[global.currentWeapon] = 0;
            }
            else    //Big shot
            {
                attackID = instance_create(box+image_xscale*10, yy, objPharaohShotCharged);
                    attackID.xspeed = image_xscale * 4.5;
                    
                if global.keyUp && !global.keyDown
                    attackID.yspeed = -4.5;
                else if global.keyDown && !global.keyUp
                    attackID.yspeed = 4.5;
                else
                    attackID.yspeed = 0;
                    
                playSFX(sfxPharaohShotCharged);
                isThrow = true;
                shootTimer = 0;
                
                global.ammo[global.currentWeapon] -= 2;
                if global.ammo[global.currentWeapon] <= 0
                    global.ammo[global.currentWeapon] = 0;
            }
            
            with objPharaohShotCharging instance_destroy();
        }
    }
    else
    {
        pharaohShotInitTimer = 0;
    }
}
else
{
    pharaohShotInitTimer = 0;
}
