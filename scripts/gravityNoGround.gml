///gravityNoGround()
//Applies gravity no matter what

yspeed += cfgGravity;
if yspeed > cfgMaxFallingSpeed
    yspeed = cfgMaxFallingSpeed;
