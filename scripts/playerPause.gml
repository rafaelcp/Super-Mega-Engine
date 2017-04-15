///playerPause()
//Pauses the game when the pause button is pressed

if global.keyPausePressed && canPause && instance_exists(prtPlayer) {
    global.weapons[global.currentWeapon].initChargeTimer = 0;
    global.weapons[global.currentWeapon].chargeTimer = 0;

    global.frozen = true;
    instance_create(x, y, objPauseMenu);
    playSFX(sfxPause);
}
