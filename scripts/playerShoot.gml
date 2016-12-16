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


//Charging
if global.enableCharge {
    if global.weapon == megabuster && (global.keyShoot || (isSlide && objMegaBusterWeapon.chargeTimer != 0)) {
        with objMegaBusterWeapon event_user(3);
    }
    else if global.weapon == megabuster && !global.keyShoot&& global.weapons[global.currentWeapon].chargeTimer != 0 {      //Release the charge shot
        with objMegaBusterWeapon event_user(4); 
    }
}


//Charging other weapons
if global.weapon != megabuster && global.weapons[global.currentWeapon].ammo > 0 {
    if global.keyShoot || (isSlide && global.weapons[global.currentWeapon].chargeTimer != 0) {    // Pressing shoot key
        with global.weapons[global.currentWeapon] event_user(3);
    }
    if !global.keyShoot && global.weapons[global.currentWeapon].chargeTimer != 0 {  // Shoot key released
        with global.weapons[global.currentWeapon] event_user(4);
    }
}
