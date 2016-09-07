///playerSwitchWeapons()
//Allows for quick weapon switching
//If you do not want quick weapon switching in your game, simply remove the script from objMegaman's step event

//Switching to the left
if global.keyWeaponSwitchLeftPressed
{
    var loops;
    loops = 0;
    
    while global.weaponUnlocked[global.currentWeapon] == false || loops == 0
    {
        global.currentWeapon -= 1;
        if global.currentWeapon < 0
            global.currentWeapon = global.totalWeapons;
            
        loops += 1;
    }
    
    drawWeaponIcon = true;
    drawWeaponIconTimer = 30;
    
    global.weapon = global.weaponSlot[global.currentWeapon];
    event_user(0); //Colors
    
    with prtPlayerProjectile instance_destroy();
    with objReflectedProjectile instance_destroy();
    with prtRush instance_destroy();
    with objRushJet instance_destroy();
    
    playSFX(sfxWeaponSwitch);
    
    sound_stop(sfxCharging);
    sound_stop(sfxCharged);
}

//Switching to the right
if global.keyWeaponSwitchRightPressed
{
    var loops;
    loops = 0;
    
    while global.weaponUnlocked[global.currentWeapon] == false || loops == 0
    {
        global.currentWeapon += 1;
        if global.currentWeapon > global.totalWeapons
            global.currentWeapon = 0;
            
        loops += 1;
    }
    
    drawWeaponIcon = true;
    drawWeaponIconTimer = 30;
    
    global.weapon = global.weaponSlot[global.currentWeapon];
    event_user(0); //Colors
    
    with prtPlayerProjectile instance_destroy();
    with objReflectedProjectile instance_destroy();
    with prtRush instance_destroy();
    with objRushJet instance_destroy();
    
    playSFX(sfxWeaponSwitch);
    
    sound_stop(sfxCharging);
    sound_stop(sfxCharged);
}

//Holding the left and right weapon switch keys at the same time results in the Mega Buster being selected
if global.keyWeaponSwitchLeft && global.keyWeaponSwitchRight && global.weapon != megabuster
{
    global.currentWeapon = 0;
    
    drawWeaponIcon = true;
    drawWeaponIconTimer = 30;
    
    global.weapon = global.weaponSlot[global.currentWeapon];
    event_user(0); //Colors
    
    with prtPlayerProjectile instance_destroy();
    with objReflectedProjectile instance_destroy();
    with prtRush instance_destroy();
    with objRushJet instance_destroy();
    
    playSFX(sfxWeaponSwitch);
    
    sound_stop(sfxCharging);
    sound_stop(sfxCharged);
}

//Timer
if drawWeaponIconTimer != -1
{
    drawWeaponIconTimer -= 1;
    if drawWeaponIconTimer == 0
    {
        drawWeaponIcon = false;
    }
}
