///gravityCheckGroundExt(grav)
//Applies gravity only if we are not on the ground
//Make sure to specify the variable 'ground' in the object [if necessary, use checkGround()]

if !ground {
    yspeed += argument0 * update_rate;
    if yspeed > cfgMaxFallingSpeed
        yspeed = cfgMaxFallingSpeed;
}
