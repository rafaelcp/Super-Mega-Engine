///playerHandleSprites()
//Handles the player's sprites, e.g. use different sprites when shooting
//Note that some sprites like sliding are static and are thus not altered in this script
if !instance_exists(global.character) exit;

if isShoot {
    spriteStand = asset_get_index("spr" + global.character.sprName + "StandShoot");
    spriteStep = asset_get_index("spr" + global.character.sprName + "StandShoot");
    spriteJump = asset_get_index("spr" + global.character.sprName + "JumpShoot");
    spriteWalk = asset_get_index("spr" + global.character.sprName + "WalkShoot");
    spriteClimb = asset_get_index("spr" + global.character.sprName + "ClimbShoot");
    spriteGetup = asset_get_index("spr" + global.character.sprName + "ClimbShoot");
}
else if isThrow {
    spriteStand = asset_get_index("spr" + global.character.sprName + "StandThrow");
    spriteStep = asset_get_index("spr" + global.character.sprName + "StandThrow");
    spriteJump = asset_get_index("spr" + global.character.sprName + "JumpThrow");
    spriteWalk = asset_get_index("spr" + global.character.sprName + "WalkThrow");
    spriteClimb = asset_get_index("spr" + global.character.sprName + "ClimbThrow");
    spriteGetup = asset_get_index("spr" + global.character.sprName + "ClimbThrow");
}
else {
    spriteStand = asset_get_index("spr" + global.character.sprName + "Stand");
    spriteStep = asset_get_index("spr" + global.character.sprName + "Step");
    spriteJump = asset_get_index("spr" + global.character.sprName + "Jump");
    spriteWalk = asset_get_index("spr" + global.character.sprName + "Walk");
    spriteClimb = asset_get_index("spr" + global.character.sprName + "Climb");
    spriteGetup = asset_get_index("spr" + global.character.sprName + "ClimbGetup");
}
