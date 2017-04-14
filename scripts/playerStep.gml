///playerStep()
//Handles general step event code for the player

//Check for ground
if place_meeting(x, y+global.yspeed+1, objSolid) || (place_meeting(x, y+global.yspeed+1, objTopSolid)  && global.yspeed >= 0)
|| (place_meeting(x, y+global.yspeed+1, prtMovingPlatformJumpthrough) && global.yspeed >= 0)
|| (place_meeting(x, y+global.yspeed+1, prtMovingPlatformSolid) && !place_meeting(x, y, prtMovingPlatformSolid))
{
    //We are only on the ground if the moving platform is not 'dead' (despawned and ready to respawn)
    if place_meeting(x, y+global.yspeed+1, objSolid)
    {
        ground = true;
    }
    else if place_meeting(x, y+global.yspeed+1, objTopSolid)
    {
        if bbox_bottom < instance_place(x, y+global.yspeed+1, objTopSolid).bbox_top
            ground = true;
        else if !onRushJet
            ground = false;
    }
    else if place_meeting(x, y+global.yspeed+1, prtMovingPlatformJumpthrough)
    {
        if instance_place(x, y+global.yspeed+1, prtMovingPlatformJumpthrough).dead == false
        {
            if bbox_bottom < instance_place(x, y+global.yspeed+1, prtMovingPlatformJumpthrough).bbox_top
                ground = true;
            else
                ground = false;
        }
        else if !onRushJet
            ground = false;
    }
    else if place_meeting(x, y+global.yspeed+1, prtMovingPlatformSolid)
    {
        if instance_place(x, y+global.yspeed+1, prtMovingPlatformSolid).dead == false
            ground = true;
        else
            ground = false;
    }
    else
    {
        ground = true;
    }
}
else
{
    ground = false;
    if prevGround == true
        y += 1; //To make Mega Man able to fall through 1-block wide gaps
}


//Should the landing sound be played when colliding with a floor? (Disabled on ladders, for example)
//Lasts two frames because one extra frame is required for the collision to register
if playLandSoundTimer < 2
{
    playLandSoundTimer += 1;
}
else
{
    playLandSound = true;
}


//Movement (includes initializing sidestep while on the ground)
if canMove == true
{
    if ground == true
    {
        if global.keyLeft && !global.keyRight
        {
            if canInitStep == true
            {
                canInitStep = false;
                isStep = true;
                image_xscale = -1;
            }
            else if isStep == false
            {
                if !(place_meeting(x, y+1, objIce) && global.xspeed > 0)
                {
                    //Normal physics
                    if !place_meeting(x-1, y, objSolid) && !place_meeting(x-1, y, prtMovingPlatformSolid)
                        global.xspeed = -walkSpeed;
                    else if place_meeting(x-1, y, prtMovingPlatformSolid) //Still walk when the moving platform is despawned
                    {
                        if instance_place(x-1, y, prtMovingPlatformSolid).dead == true
                            global.xspeed = -walkSpeed;
                    }
                }
                else
                {
                    //Ice physics
                    if !place_meeting(x-1, y, objSolid) && !place_meeting(x-1, y, prtMovingPlatformSolid)
                        global.xspeed -= iceDecWalk;
                    else if place_meeting(x-1, y, prtMovingPlatformSolid) //Still walk when the moving platform is despawned
                    {
                        if instance_place(x-1, y, prtMovingPlatformSolid).dead == true
                            global.xspeed -= iceDecWalk;
                    }
                }
                    
                image_xscale = -1;
                            
                if canSpriteChange == true
                {
                    sprite_index = spriteWalk;
                    image_speed = 0.15;
                }
            }
        }
        else if global.keyRight && !global.keyLeft
        {
            if canInitStep == true
            {
                canInitStep = false;
                isStep = true;
                image_xscale = 1;
            }
            else if isStep == false
            {
                if !(place_meeting(x, y+1, objIce) && global.xspeed < 0)
                {
                    //Normal physics
                    if !place_meeting(x+1, y, objSolid) && !place_meeting(x+1, y, prtMovingPlatformSolid)
                        global.xspeed = walkSpeed;
                    else if place_meeting(x+1, y, prtMovingPlatformSolid) //Still walk when the moving platform is despawned
                    {
                        if instance_place(x+1, y, prtMovingPlatformSolid).dead == true
                            global.xspeed = walkSpeed;
                    }
                }
                else
                {
                    //Ice physics
                    if !place_meeting(x+1, y, objSolid) && !place_meeting(x+1, y, prtMovingPlatformSolid)
                        global.xspeed += iceDecWalk;
                    else if place_meeting(x+1, y, prtMovingPlatformSolid) //Still walk when the moving platform is despawned
                    {
                        if instance_place(x+1, y, prtMovingPlatformSolid).dead == true
                            global.xspeed += iceDecWalk;
                    }
                }
                    
                image_xscale = 1;
                
                if canSpriteChange == true
                {
                    sprite_index = spriteWalk;
                    image_speed = 0.15;
                }
            }
        }
        else
        {
            if !(place_meeting(x, y+1, objIce) && global.xspeed != 0)
            {
                //Normal physics
                global.xspeed = 0;
                canInitStep = true;
            }
            else
            {
                //Ice physics
                if global.xspeed > 0
                    global.xspeed -= iceDec;
                else if global.xspeed < 0
                    global.xspeed += iceDec;
                    
                if global.xspeed > -iceDec && global.xspeed < iceDec
                    global.xspeed = 0;
            }
            
            if global.keyLeft && !global.keyRight
                image_xscale = -1;
            else if global.keyRight && !global.keyLeft
                image_xscale = 1;
            
            if canSpriteChange {
                image_speed = 0;
                if !prevGround {    //Landing animation
                    sprite_index = spriteWalk;
                    image_index = 1;
                }
                else {
                    sprite_index = spriteStand;
                    image_index = blinkImage;
                }
            }
        }
    }
    else
    {
        canInitStep = false;
        isStep = false;
        
        if canSpriteChange == true
            sprite_index = spriteJump;
            
        if global.keyLeft && !global.keyRight && !place_meeting(x-1, y, objSolid)
        {
            if !place_meeting(x-1, y, prtMovingPlatformSolid)
            {
                global.xspeed = -walkSpeed;
                image_xscale = -1;
            }
            else
            {
                if instance_place(x-1, y, prtMovingPlatformSolid).dead == true //Still allow movement when the moving platform is despawned
                {
                    global.xspeed = -walkSpeed;
                    image_xscale = -1;
                }
            }
        }
        else if global.keyRight && !global.keyLeft && !place_meeting(x+1 + (prevXScale == -1), y, objSolid) //For some reason, while on the left of the wall and facing left, then jumping and holding right would clip you through it. Prevented by checking if the player was facing left on the previous frame, and if so, disallow Mega Man to move if 2 pixels away from the wall instead of 1
        {
            if !place_meeting(x+1 + (prevXScale == -1), y, prtMovingPlatformSolid)
            {
                global.xspeed = walkSpeed;
                image_xscale = 1;
            }
            else
            {
                if instance_place(x+1 + (prevXScale == -1), y, prtMovingPlatformSolid).dead == true //Still allow movement when the moving platform is despawned
                {
                    global.xspeed = walkSpeed;
                    image_xscale = 1;
                }
            }
        }
        else
        {
            global.xspeed = 0;
            
            if global.keyLeft && !global.keyRight
                image_xscale = -1;
            else if global.keyRight && !global.keyLeft
                image_xscale = 1;
        }
    }
}
else if canSpriteChange == true
{
    //Even if canMove is false, we should still be able to change sprites
    if ground == true
    {
        if global.xspeed == 0
        {
            sprite_index = spriteStand;
            image_index = blinkImage;
            image_speed = 0;
        }
        else
        {
            sprite_index = spriteWalk;
            image_speed = 0.15;
        }
    }
    else
    {
        sprite_index = spriteJump;
    }
}


//Blinking animation
if sprite_index == asset_get_index("spr" + global.sprName + "Stand") { //Don't use spriteStand as this could also be sprMegamanStandShoot!
    blinkTimer++;
    if blinkImage == 0 {
        if blinkTimer >= blinkTimerMax {
            blinkImage = 1;
            blinkTimer = 0;
        }
    }
    else {
        if blinkTimer >= blinkDuration {
            blinkImage = 0;
            blinkTimer = 0;
        }
    }
}
else {
    blinkTimer = 0;
    blinkImage = 0;
}


//Sidestepping
if isStep {
    if !place_meeting(x+image_xscale, y, objSolid) && !place_meeting(x+image_xscale, y, prtMovingPlatformSolid)
        global.xspeed = stepSpeed * image_xscale;
    else if place_meeting(x+image_xscale, y, prtMovingPlatformSolid) {
        if instance_place(x+image_xscale, y, prtMovingPlatformSolid).dead == true //Still allow movement when the moving platform is despawned
            global.xspeed = stepSpeed * image_xscale;
    }
    
    if canSpriteChange
        sprite_index = spriteStep;
    
    stepTimer++;
    if stepTimer >= stepFrames {
        isStep = false;
        stepTimer = 0;
    }
}


//Allow movement
move(global.xspeed, global.yspeed);

//Avoids free movement on screen above
if (!ground && !climbing && !instance_exists(objSectionSwitcher) && sprite_get_bottom() < sectionTop) {
    y = sectionTop - sprite_height;
}


//Stop movement at section borders
if (canMove || isSlide) && visible {
    if x > sectionRight-6 && !place_meeting(x+6, y, objSectionArrowRight) && !place_meeting(x-global.xspeed, y, objSectionArrowRight) {
        x = sectionRight-6;
        global.xspeed = 0;
    }
    else if x < sectionLeft+6 && !place_meeting(x-6, y, objSectionArrowLeft) && !place_meeting(x-global.xspeed, y, objSectionArrowLeft) {
        x = sectionLeft+6;
        global.xspeed = 0;
    }    
    if y < sectionTop-32 {
        y = sectionTop-32;
    }
    else if bbox_top > sectionBottom && !place_meeting(x, y, objSectionArrowDown) {
        global._health = 0;
        deathByPit = true;
    }
}   
    
//Stop movement at room borders
if x > room_width-6
    x = room_width-6;
else if x < 6
    x = 6;
    
if y < -32
    y = -32;
else if bbox_top > room_height
{
    global._health = 0;
    deathByPit = true;
}


//Jumping
if (canMove || (isThrow and room != rmWeaponGet) || onRushJet) && ground && global.keyJumpPressed && !global.keyDown
{
    if isThrow {  //We can jump-cancel the throwing animation (after throwing a Metal Blade, Pharaoh Shot etc)
        canMove = true;
        canSpriteChange = true;
        shootTimer -= 5; //20 frames for freezing was too long so it was changed to 15. However, when not frozen, 20 looks better
    }
    else if onRushJet {
        canMove = true;
    }
    
    global.yspeed = -currentJumpSpeed;
    ground = false;
    canMinJump = true;
    y -= 1; //To negate the prevGround y += 1
    sprite_index = spriteJump;
}


//Minjumping (lowering jump when the jump button is released)
if ground == false && global.yspeed < 0 && !global.keyJump && canMinJump == true
{
    canMinJump = false;
    global.yspeed = 0;
}


var box;
if image_xscale == 1
    box = bbox_right;
else
    box = bbox_left;
    
//Sliding
if enableSlide {
    if ground && !isSlide && ((global.keyJumpPressed && global.keyDown) || (global.enableSlideKey && global.keySlidePressed)) 
        && (canMove || (isThrow and room != rmWeaponGet)) && !position_meeting(box+image_xscale*5, bbox_bottom-12, objSolid)
    {
        var canSld = false;
        
        if !position_meeting(box+image_xscale*5, bbox_bottom-12, prtMovingPlatformSolid) {
            canSld = true;
        }
        else {
            if instance_position(box+image_xscale*5, bbox_bottom-12, prtMovingPlatformSolid).dead == true //We can still slide if the moving platform is despawned
                canSld = true;
        }
        
        
        if canSld {
            if isThrow {
                isThrow = false;
                shootTimer -= 5; //20 frames for freezing was too long so it was changed to 15. However, when not frozen, 20 looks better
            }
            
            isSlide = true;
            canMove = false;
            canSpriteChange = false;
            sprite_index = spriteSlide;
            mask_index = mskMegamanSlide;
            
            if image_xscale == -1
                with instance_create(bbox_right-2, bbox_bottom-2, objSlideDust) image_xscale = -1;
            else
                instance_create(bbox_left+2, bbox_bottom-2, objSlideDust);
            
            /*while position_meeting(x, y+5, objSolid) || (position_meeting(x, y+5, prtMovingPlatformSolid) && !instance_position(x, y+5, prtMovingPlatformSolid).dead) {
                x += image_xscale;
            }*/
            
            global.xspeed = slideSpeed * image_xscale;
        }
    }
    
    
    //While sliding
    if isSlide {
        image_speed = 1/6;
        isStep = false;
        canInitStep = false;
        slideTimer++;
        
        var canProceed = true;
        
        if ((place_meeting(x, y-3, objSolid) and !place_meeting(x, y-3, objSpike)) || place_meeting(x, y-3, prtMovingPlatformSolid)) && (ground == true || place_meeting(x-(slideSpeed-1), y+1, objSolid) || place_meeting(x-(slideSpeed-1), y+1, objTopSolid) || place_meeting(x-(slideSpeed-1), y+1, prtMovingPlatformJumpthrough) || place_meeting(x-(slideSpeed-1), y+1, prtMovingPlatformSolid)
        || place_meeting(x+(slideSpeed-1), y, objSolid) || place_meeting(x+(slideSpeed-1), y, prtMovingPlatformSolid)) //Extra check because if Mega Man falls down while sliding and a wall is on the other side of him and a ceiling is on top of him, when turning around on the right frame he would zip through the solids
        {            
            if place_meeting(x, y-3, prtMovingPlatformSolid)
            {
                if instance_place(x, y-3, prtMovingPlatformSolid).dead == true
                    canProceed = false;
            }
            if place_meeting(x-(slideSpeed-1), y+1, prtMovingPlatformSolid)
            {
                if instance_place(x-(slideSpeed-1), y+1, prtMovingPlatformSolid).dead == true
                    canProceed = false;
            }
            if place_meeting(x+(slideSpeed-1), y, prtMovingPlatformSolid)
            {
                if instance_place(x+(slideSpeed-1), y, prtMovingPlatformSolid).dead == true
                    canProceed = false;
            }
            if place_meeting(x-(slideSpeed-1), y+1, prtMovingPlatformJumpthrough)
            {
                if instance_place(x-(slideSpeed-1), y+1, prtMovingPlatformJumpthrough).dead == true
                    canProceed = false;
            }
            
            if canProceed {
                if global.keyLeft && !global.keyRight
                {
                    image_xscale = -1;
                    global.xspeed = -slideSpeed;
                }
                else if global.keyRight && !global.keyLeft
                {
                    image_xscale = 1;
                    global.xspeed = slideSpeed;
                }
                
                ground = true;  //For the bugfix as explained on the second line of the place_meeting checks
            }
        }
        else
        {
            canProceed = false;
        }
        
        
        if !canProceed {
            if !ground || (global.keyLeft && !global.keyRight && image_xscale == 1)
            || (global.keyRight && !global.keyLeft && image_xscale == -1)
            || slideTimer >= slideFrames || (global.keyJumpPressed && !global.keyDown)
            || place_meeting(x+image_xscale*3, y, objSolid) || place_meeting(x+image_xscale*3, y, prtMovingPlatformSolid)
            {
                var stopSld = true;
                
                if !ground || (global.keyLeft && !global.keyRight && image_xscale == 1)
                || (global.keyRight && !global.keyLeft && image_xscale == -1)
                || slideTimer >= slideFrames || (global.keyJumpPressed && !global.keyDown)
                || place_meeting(x+image_xscale*3, y, objSolid)
                {
                    stopSld = true;
                }
                else if place_meeting(x+image_xscale*3, y, prtMovingPlatformSolid)
                {
                    if instance_place(x+image_xscale*3, y, prtMovingPlatformSolid).dead == true //We should not stop sliding if the moving platform is despawned
                        stopSld = false;
                }
                
                if stopSld {
                    isSlide = false;
                    canMove = true;
                    canSpriteChange = true;
                    mask_index = mskMegaman;
                    slideTimer = 0;
                    
                    var endLoop = false;
                    
                    //Pushing down until not inside a ceiling anymore
                    while (place_meeting(x, y, objSolid) || place_meeting(x, y, prtMovingPlatformSolid)) && endLoop == false      //If your slide cancels right under a ceiling, move MM down
                    {
                        if place_meeting(x, y, objSpike) {
                            playerCollision();
                            break;
                        }
                        if !place_meeting(x, y, objSolid) && place_meeting(x, y, prtMovingPlatformSolid)
                        {
                            if instance_place(x, y, prtMovingPlatformSolid).dead == true
                                endLoop = true;
                        }
                        
                        if !endLoop {
                            y++;
                            sprite_index = spriteJump;
                            ground = false;
                        }
                    }
                        
                    if !place_meeting(x, y+1, objIce)
                        global.xspeed = 0;
                    else
                        global.xspeed = walkSpeed * image_xscale;
                    
                    if global.keyJumpPressed && !global.keyDown
                    {
                        global.yspeed = -jumpSpeed;
                        ground = false;
                        y -= 1; //To negate the prevGround y += 1
                    }
                }
            }
        }
    }
    else
    {
        slideTimer = 0;
    }
}


//Climbing
var ladder, ladderDown;
ladder = collision_rectangle(sprite_get_xcenter()-3, bbox_top+4, sprite_get_xcenter()+3, bbox_bottom-1, objLadder, false, false);
ladderDown = collision_rectangle(sprite_get_xcenter()-1, bbox_bottom+1, sprite_get_xcenter()+1, bbox_bottom+2, objLadder, false, false);
var solidDown = collision_rectangle(sprite_get_xcenter()-1, bbox_bottom+1, sprite_get_xcenter()+1, bbox_bottom+2, objSolid, false, false);
var solidAbove = false;
if (ladderDown >= 0) {
    with ladderDown {
        solidAbove = !place_free(x, y - 1);
    }
}
if ((ladder >= 0 && global.keyUp && !global.keyDown)
|| (ladderDown >= 0 and solidDown < 0 and !solidAbove and ground and !isSlide and global.keyDown and !global.keyUp and !place_meeting(x, y, objLadder)))
&& (canMove == true || isSlide == true) && sprite_get_bottom() > sectionTop {
    isSlide = false;
    mask_index = mskMegaman;
    slideTimer = 0;
    
    climbing = true;
    canMove = false;
    canSpriteChange = false;
    canGravity = false;
    
    global.xspeed = 0;
    global.yspeed = 0;
    
    if ladder >= 0
        x = ladder.x+8;
    else if ladderDown >= 0
    {
        x = ladderDown.x+8;
        y += climbSpeed * 2 + 2;
        ground = false;
    }
    
    sprite_index = spriteClimb;
    image_speed = 0;
    
    ladderXScale = image_xscale;
    climbShootXscale = ladderXScale;
}


//While climbing
if climbing == true
{
    isStep = false;
    canInitStep = false;
    
    //Movement
    if global.keyUp && !global.keyDown && isShoot == false && isThrow == false
    {
        climbSpriteTimer += 1;
        global.yspeed = -climbSpeed;
    }
    else if global.keyDown && !global.keyUp && isShoot == false && isThrow == false
    {
        climbSpriteTimer += 1;
        global.yspeed = climbSpeed;
    }
    else
    {
        global.yspeed = 0;
    }
    
    //Left/right
    if global.keyRight && !global.keyLeft
        climbShootXscale = 1;
    else if global.keyLeft && !global.keyRight
        climbShootXscale = -1;
    
    if climbSpriteTimer >= 8 && sprite_index == spriteClimb && isShoot == false && isThrow == false
    {
        climbSpriteTimer = 0;
        image_xscale = -image_xscale;
    }
    
    //Getup sprite
    if !position_meeting(x, bbox_top+7, objLadder) && position_meeting(x, bbox_bottom+1, objLadder) //The second check is to make sure the getup animation is not shown when on the BOTTOM of a ladder that's placed in the air
    {
        sprite_index = spriteGetup;
        if sprite_index == sprMegamanClimbGetup //not when shooting
            image_xscale = 1;
        if global.yspeed < 0 && !position_meeting(x, bbox_top+14, objLadder) {
            while place_meeting(x, y, objLadder) {
                y--;
            }
        }
    }
    else
    {
        sprite_index = spriteClimb;
    }
    
    //Releasing the ladder
    if (ground == true && !global.keyUp) || !place_meeting(x, y, objLadder) || (global.keyJumpPressed && !global.keyUp)
    {
        climbing = false;
        canMove = true;
        canSpriteChange = true;
        canGravity = true;
        image_xscale = ladderXScale;
        global.yspeed = 0;
        
        if position_meeting(x, bbox_bottom+15, objTopSolid) || ground == true {
            ground = true;  //To avoid "falling" after climbing (shouldn't play the landing sfx)
            if (global.keyRight && !global.keyLeft) || (global.keyLeft && !global.keyRight) {
                sprite_index = spriteWalk;
                
                if global.keyRight {
                    global.xspeed = walkSpeed;
                    image_xscale = 1;
                }
                else if global.keyLeft {
                    global.xspeed = -walkSpeed;
                    image_xscale = -1;
                }
            }
            else {
                sprite_index = spriteStand;
            }
        }
        else {
            sprite_index = spriteJump;
        }
        
        if !place_meeting(x, y+1, objLadder)
        {
            var topSolidID;
            topSolidID = instance_place(x, y+2, objTopSolid);
            if topSolidID >= 0
                y = topSolidID.y - (sprite_get_height(mask_index) - sprite_get_yoffset(mask_index));
                
            playLandSound = false;
            playLandSoundTimer = 0;
        }
    }
}


//Water
if place_meeting(x, y, objWater) && inWater == false
{
    inWater = true;
    playSFX(sfxSplash);
    
    var currentWater;
    currentWater = instance_place(x, y, objWater);
    instance_create(x, currentWater.bbox_top+1, objSplash);
}

if inWater == true
{
    currentGrav = gravWater;
    currentJumpSpeed = jumpSpeedWater;
    
    bubbleTimer += 1;
    if bubbleTimer >= 10
    {
        bubbleTimer = 0;
        if !instance_exists(objAirBubble)
            instance_create(x, y, objAirBubble);
    }
}
else
{
    currentGrav = grav;
    currentJumpSpeed = jumpSpeed;
    bubbleTimer = 0;
}


//Leaving the water
if inWater == true
{
    var wtr;
    wtr = instance_place(x, y-global.yspeed, objWater);
    if wtr >= 0
    {
        if bbox_bottom < wtr.bbox_top
        {
            instance_create(x, wtr.bbox_top+1, objSplash);
            inWater = false;
            playSFX(sfxSplash);
        }
    }
}
    

//While being hit
if isHit {
    hitTimer += 1;
    if hitTimer >= hitTime {
        isHit = false;
        drawHitspark = false;
        hitTimer = 0;
        
        //When sliding and there's a solid above us, we should not experience knockback
        //If we did, we would clip inside the ceiling above us
        if !(isSlide && (place_meeting(x, y-3, objSolid) || place_meeting(x, y-3, prtMovingPlatformSolid))) {
            canMove = true;
            canSpriteChange = true;
        }
        
        invincibilityTimer = 60;
    }
    else {
        if hitTimer mod 4 == 0 || hitTimer mod 4 == 1  //mod: modulo, %. Gives the remainder
            drawHitspark = true;
        else
            drawHitspark = false;
    }
}


//Invincibility
if invincibilityTimer != 0
{
    invincibilityTimer -= 1;
    if invincibilityTimer <= 0
    {
        invincibilityTimer = 0;
        canHit = true;
        visible = true;
    }
    else
    {
        if invincibilityTimer mod 2 == 1
            visible = false;
        else
            visible = true;
    }
}


//Dying
if global._health <= 0 {
    if !deathByPit {
        var i, explosionID;
            
        i = 0;
        repeat 8 {
            explosionID = instance_create(x, y, objMegamanExplosion);
            explosionID.dir = i;
            explosionID.spd = 1.5;
                
            i += 45;
        }
        
        i = 0;
        repeat 8 {
            explosionID = instance_create(x, y, objMegamanExplosion);
            explosionID.dir = i;
            explosionID.spd = 2.5;
                
            i += 45;
        }
    }
    
    instance_create(x, y, objMegamanDeathTimer); //Because the Mega Man object is destoyed upon death, we need to make a different object execute the room restarting code
    instance_destroy();
    
    stopAllSFX();
    playSFX(sfxDeath);
}


//Gravity
if ground == false && canGravity == true
{
    global.yspeed += currentGrav;
    if global.yspeed > maxVspeed
        global.yspeed = maxVspeed;
}
else
{
    canMinJump = true;
}


//Variables on the previous frame
prevGround = ground;
prevXScale = image_xscale;


escapeWall();
