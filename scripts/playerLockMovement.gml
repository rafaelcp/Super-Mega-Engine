///playerLockMovement()
//Locks the player's movement

with prtPlayer {
    isStep = false;
    climbing = false;
    canGravity = true;
    isShoot = false;
    isThrow = false;
    canMove = false;
    canSpriteChange = true;
    isSlide = false;
    canPause = false;
    onRushJet = false;
    mask_index = mskMegaman;
    global.xspeed = 0;
    global.yspeed = 0;
}
