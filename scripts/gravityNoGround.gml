///gravityNoGround()
//Applies gravity no matter what

yspeed += cfgGravity * update_rate;
if yspeed > cfgMaxFallingSpeed
    yspeed = cfgMaxFallingSpeed;
