///playerShoot()
//Handles Mega Man's shooting


var box, yy, attackID;
if image_xscale == 1
    box = bbox_right + shoot_shift;
else
    box = bbox_left - shoot_shift;
    
switch sprite_index
{
    case spriteStand: yy = y+shoot_height; break;
    case spriteStep: yy = y+shoot_height; break;
    case spriteWalk: yy = y+shoot_height; break;
    case spriteJump: yy = y+jump_shoot_height; break;
    case spriteClimb: yy = y+shoot_height; break;
    default: yy = y+shoot_height; break;
}


//Shooting
if global.keyShootPressed && canShoot && (canMove || climbing || (isThrow and room != rmWeaponGet) || onRushJet)
&& instance_number(objBusterShotCharged) < 1 && global.ammo[global.currentWeapon] > 0
{   
    if climbing {
        image_xscale = climbShootXscale;
        
        if image_xscale == 1
            box = bbox_right;
        else
            box = bbox_left;
    }
    
    with global.weapons[global.weapon] {
        print("Trying to use " + name + " with " + string(ammo) + " ammo");
        event_user(1);
    }
    
}


//While shooting
if isShoot {
    isThrow = false;
    shootTimer++;
    if shootTimer >= 20 {
        isShoot = false;
    }
}
else if isThrow { //Throwing weapons, like Pharaoh Shot and Metal Blade
    isShoot = false;
    
    //To allow shooting in the opposite direction
    if global.keyShootPressed {
        if global.keyRight && !global.keyLeft
            image_xscale = 1;
        else if global.keyLeft && !global.keyRight
            image_xscale = -1;
    }
    
    if ground && shootTimer == 0 && !climbing { //Only do this on the ground on the first frame
        canMove = false;
        global.xspeed = 0;
        canSpriteChange = false;
        playerHandleSprites(); //We need to call this script because between throwing and checking throwing, it isn't executed and the wrong sprite would display
        sprite_index = spriteStand;
        shootTimer = 5; //20 frames is too much to be frozen for. However, when not frozen, 20 frames looks better
    }
    
    if !ground && !climbing {
        canMove = true;
        canSpriteChange = true;
    }
    
    shootTimer++;
    if shootTimer >= 20 {
        isThrow = false;
        if ground {
            canMove = true;
            canSpriteChange = true;
        }
    }
}

instance_activate_object(prtWeapon);

//Charging weapons
if global.weapons[global.currentWeapon].ammo > 0 and room != rmWeaponGet {
    if global.keyShoot || (isSlide && global.weapons[global.currentWeapon].chargeTimer != 0) {    // Pressing shoot key
        with global.weapons[global.currentWeapon] event_user(3);
    }
    if !global.keyShoot && global.weapons[global.currentWeapon].chargeTimer != 0 {  // Shoot key released
        with global.weapons[global.currentWeapon] event_user(4);
    }
}
