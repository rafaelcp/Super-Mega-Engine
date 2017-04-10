///setPlayer(player): set the current player character

var player = argument0;
if !object_exists(player) {
    return false;
}
global.character = player;

var char = instance_create(0, 0, player);

global.name = char.name;
global.sprName = char.sprName;
global.defaultWeapon = char.defaultWeapon;
global.spriteLife = char.spriteLife;
global.spriteStageSelect = char.spriteStageSelect;
global.stageSelectFollow = char.stageSelectFollow;
global.charPrimaryColor = char.primary_color;
global.charSecondaryColor = char.secondary_color;
global.spriteStand = asset_get_index("spr" + char.sprName + "Stand");
global.spriteJump = asset_get_index("spr" + char.sprName + "Jump");
global.blinkTimerMax = char.blinkTimerMax;
global.blinkDuration = char.blinkDuration;
global.src_col1 = char.src_col1;
global.src_col2 = char.src_col2;
global.src_col3 = char.src_col3;


with char instance_destroy();
