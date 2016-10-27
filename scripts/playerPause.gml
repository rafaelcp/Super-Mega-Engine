///playerPause()
//Pauses the game when the pause button is pressed

if global.keyPausePressed && canPause {
    global.frozen = true;
    instance_create(x, y, objPauseMenu);
    playSFX(sfxPause);
}
