///drawPlayer()
//Draws the player. If using special weapons, whitemasks will be used

//Set the correct whitemasks    
var primary, secondary, outline;

switch sprite_index
{
    case sprMegamanStand:
        primary = sprMegamanStandPrimary;
        secondary = sprMegamanStandSecondary;
        outline = sprMegamanStandOutline;
    break;
    
    case sprMegamanStep:
        primary = sprMegamanStepPrimary;
        secondary = sprMegamanStepSecondary;
        outline = sprMegamanStepOutline;
    break;
    
    case sprMegamanWalk:
        primary = sprMegamanWalkPrimary;
        secondary = sprMegamanWalkSecondary;
        outline = sprMegamanWalkOutline;
    break;
    
    case sprMegamanJump:
        primary = sprMegamanJumpPrimary;
        secondary = sprMegamanJumpSecondary;
        outline = sprMegamanJumpOutline;
    break;
    
    case sprMegamanStandShoot:
        primary = sprMegamanStandShootPrimary;
        secondary = sprMegamanStandShootSecondary;
        outline = sprMegamanStandShootOutline;
    break;
    
    case sprMegamanWalkShoot:
        primary = sprMegamanWalkShootPrimary;
        secondary = sprMegamanWalkShootSecondary;
        outline = sprMegamanWalkShootOutline;
    break;
    
    case sprMegamanJumpShoot:
        primary = sprMegamanJumpShootPrimary;
        secondary = sprMegamanJumpShootSecondary;
        outline = sprMegamanJumpShootOutline;
    break;
    
    case sprMegamanStandThrow:
        primary = sprMegamanStandThrowPrimary;
        secondary = sprMegamanStandThrowSecondary;
        outline = sprMegamanStandThrowOutline;
    break;
    
    case sprMegamanWalkThrow:
        primary = sprMegamanWalkThrowPrimary;
        secondary = sprMegamanWalkThrowSecondary;
        outline = sprMegamanWalkThrowOutline;
    break;
    
    case sprMegamanJumpThrow:
        primary = sprMegamanJumpThrowPrimary;
        secondary = sprMegamanJumpThrowSecondary;
        outline = sprMegamanJumpThrowOutline;
    break;
    
    case sprMegamanSlide:
        primary = sprMegamanSlidePrimary;
        secondary = sprMegamanSlideSecondary;
        outline = sprMegamanSlideOutline;
    break;
    
    case sprMegamanClimb:
        primary = sprMegamanClimbPrimary;
        secondary = sprMegamanClimbSecondary;
        outline = sprMegamanClimbOutline;
    break;
    
    case sprMegamanClimbShoot:
        primary = sprMegamanClimbShootPrimary;
        secondary = sprMegamanClimbShootSecondary;
        outline = sprMegamanClimbShootOutline;
    break;
    
    case sprMegamanClimbThrow:
        primary = sprMegamanClimbThrowPrimary;
        secondary = sprMegamanClimbThrowSecondary;
        outline = sprMegamanClimbThrowOutline;
    break;
    
    case sprMegamanClimbGetup:
        primary = sprMegamanClimbGetupPrimary;
        secondary = sprMegamanClimbGetupSecondary;
        outline = sprMegamanClimbGetupOutline;
    break;
    
    case sprMegamanHit:
        primary = sprMegamanHitPrimary;
        secondary = sprMegamanHitSecondary;
        outline = sprMegamanHitOutline;
    break;
    
    case sprMegamanTeleport:
        primary = sprMegamanTeleportPrimary;
        secondary = sprMegamanTeleportSecondary;
        outline = sprMegamanTeleportOutline;
    break;
}

drawSelf3Colors(global.primaryCol, global.secondaryCol, global.outlineCol);

/*
draw_sprite_ext(primary, image_index, round(x), round(y), image_xscale, image_yscale, image_angle, global.primaryCol, image_alpha);
draw_sprite_ext(secondary, image_index, round(x), round(y), image_xscale, image_yscale, image_angle, global.secondaryCol, image_alpha);
draw_sprite_ext(outline, image_index, round(x), round(y), image_xscale, image_yscale, image_angle, global.outlineCol, image_alpha);
*/
