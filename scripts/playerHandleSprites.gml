///playerHandleSprites()
//Handles the player's sprites, e.g. use different sprites when shooting
//Note that some sprites like sliding are static and are thus not altered in this script


if isShoot == true
{
    spriteStand = sprMegamanStandShoot;
    spriteStep = sprMegamanStandShoot;
    spriteJump = sprMegamanJumpShoot;
    spriteWalk = sprMegamanWalkShoot;
    spriteClimb = sprMegamanClimbShoot;
    spriteGetup = sprMegamanClimbShoot;
}
else if isThrow == true
{
    spriteStand = sprMegamanStandThrow;
    spriteStep = sprMegamanStandThrow;
    spriteJump = sprMegamanJumpThrow;
    spriteWalk = sprMegamanWalkThrow;
    spriteClimb = sprMegamanClimbThrow;
    spriteGetup = sprMegamanClimbThrow;
}
else
{
    spriteStand = sprMegamanStand;
    spriteStep = sprMegamanStep;
    spriteJump = sprMegamanJump;
    spriteWalk = sprMegamanWalk;
    spriteClimb = sprMegamanClimb;
    spriteGetup = sprMegamanClimbGetup;
}
