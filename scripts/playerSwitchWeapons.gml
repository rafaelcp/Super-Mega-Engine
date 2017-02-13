///playerSwitchWeapons()
//Allows for quick weapon switching
//If you do not want quick weapon switching in your game, simply remove the script from objMegaman's step event

if global.totalWeapons < 2 or room == rmWeaponGet {
    return false;
}

//Switching to the left
if global.keyWeaponSwitchLeftPressed {
    global.weapons[global.currentWeapon].initChargeTimer = 0;
    global.weapons[global.currentWeapon].chargeTimer = 0;
    do {
        global.currentWeapon--;
        if global.currentWeapon < 0
            global.currentWeapon = global.totalWeapons - 1;            
    } until global.weapons[global.currentWeapon].unlocked;
    
    global.weapons[global.currentWeapon].initChargeTimer = 0;
    global.weapons[global.currentWeapon].chargeTimer = 0;
    with global.weapons[global.currentWeapon] event_user(0);

    drawWeaponIcon = true;
    drawWeaponIconTimer = 30;
    
    global.weapon = global.currentWeapon;
    event_user(0); //Colors
    
    with prtPlayerProjectile if destroyOnSwitch instance_destroy();
    with objReflectedProjectile instance_destroy();
    with prtRush instance_destroy();
    with objRushJet instance_destroy();
    shootTimer = 20;
        
    playSFX(sfxWeaponSwitch);
    
    sound_stop(sfxCharging);
    sound_stop(sfxCharged);
}

//Switching to the right
if global.keyWeaponSwitchRightPressed {
    global.weapons[global.currentWeapon].initChargeTimer = 0;
    global.weapons[global.currentWeapon].chargeTimer = 0;
    do {
        global.currentWeapon++;
        if global.currentWeapon > global.totalWeapons - 1
            global.currentWeapon = 0;
    } until global.weapons[global.currentWeapon].unlocked;
    
    global.weapons[global.currentWeapon].initChargeTimer = 0;
    global.weapons[global.currentWeapon].chargeTimer = 0;
    with global.weapons[global.currentWeapon] event_user(0);
    
    drawWeaponIcon = true;
    drawWeaponIconTimer = 30;
    
    global.weapon = global.currentWeapon;
    event_user(0); //Colors
    
    with prtPlayerProjectile if destroyOnSwitch instance_destroy();
    with objReflectedProjectile instance_destroy();
    with prtRush instance_destroy();
    with objRushJet instance_destroy();
    shootTimer = 20;
            
    playSFX(sfxWeaponSwitch);
    
    sound_stop(sfxCharging);
    sound_stop(sfxCharged);
}

//Holding the left and right weapon switch keys at the same time results in the Mega Buster being selected
if global.keyWeaponSwitchLeft && global.keyWeaponSwitchRight && global.weapon != objMegaBusterWeapon.ID {
    global.weapons[global.currentWeapon].initChargeTimer = 0;
    global.weapons[global.currentWeapon].chargeTimer = 0;

        global.currentWeapon = 0;
    
    global.weapons[global.currentWeapon].initChargeTimer = 0;
    global.weapons[global.currentWeapon].chargeTimer = 0;
    with global.weapons[global.currentWeapon] event_user(0);
    
    drawWeaponIcon = true;
    drawWeaponIconTimer = 30;
    
    global.weapon = global.currentWeapon;
    event_user(0); //Colors
    
    with prtPlayerProjectile if destroyOnSwitch instance_destroy();
    with objReflectedProjectile instance_destroy();
    with prtRush instance_destroy();
    with objRushJet instance_destroy();
    shootTimer = 20;
        
    playSFX(sfxWeaponSwitch);
    
    sound_stop(sfxCharging);
    sound_stop(sfxCharged);
}

//Timer
if drawWeaponIconTimer != -1 {
    drawWeaponIconTimer--;
    if drawWeaponIconTimer == 0 {
        drawWeaponIcon = false;
    }
}
