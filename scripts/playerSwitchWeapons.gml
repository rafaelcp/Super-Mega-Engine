///playerSwitchWeapons()
//Allows for quick weapon switching
//If you do not want quick weapon switching in your game, simply remove the script from objMegaman's step event

//Switching to the left
if global.keyWeaponSwitchLeftPressed {
    do {
        global.currentWeapon--;
        if global.currentWeapon < 0
            global.currentWeapon = global.totalWeapons - 1;            
    } until global.weaponUnlocked[global.currentWeapon];
    
    drawWeaponIcon = true;
    drawWeaponIconTimer = 30;
    
    global.weapon = global.weaponSlot[global.currentWeapon];
    event_user(0); //Colors
    
    with prtPlayerProjectile instance_destroy();
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

    do {
        global.currentWeapon++;
        if global.currentWeapon > global.totalWeapons - 1
            global.currentWeapon = 0;
    } until global.weaponUnlocked[global.currentWeapon];
    
    drawWeaponIcon = true;
    drawWeaponIconTimer = 30;
    
    global.weapon = global.weaponSlot[global.currentWeapon];
    event_user(0); //Colors
    
    with prtPlayerProjectile instance_destroy();
    with objReflectedProjectile instance_destroy();
    with prtRush instance_destroy();
    with objRushJet instance_destroy();
    shootTimer = 20;
            
    playSFX(sfxWeaponSwitch);
    
    sound_stop(sfxCharging);
    sound_stop(sfxCharged);
}

//Holding the left and right weapon switch keys at the same time results in the Mega Buster being selected
if global.keyWeaponSwitchLeft && global.keyWeaponSwitchRight && global.weapon != megabuster {
    global.currentWeapon = 0;
    
    drawWeaponIcon = true;
    drawWeaponIconTimer = 30;
    
    global.weapon = global.weaponSlot[global.currentWeapon];
    event_user(0); //Colors
    
    with prtPlayerProjectile instance_destroy();
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
    drawWeaponIconTimer -= 1;
    if drawWeaponIconTimer == 0 {
        drawWeaponIcon = false;
    }
}
