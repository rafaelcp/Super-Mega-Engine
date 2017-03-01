///apply_password(tern_pass)
var tern_pass = argument0;
var bin_pass = block_base_convert(tern_pass, 3, 2, 2, 3);
bin_pass = string_lpad(bin_pass, 96, "0");

var pos = 1;

var charlen = ceil(log2(global.totalCharacters));
setPlayer(global.characters[real(base_convert(string_copy(bin_pass, pos, charlen), 2, 10))]);
pos += charlen;
global._lives = real(base_convert(string_copy(bin_pass, pos, 4), 2, 10));
pos += 4;
global.screws = real(base_convert(string_copy(bin_pass, pos, 10), 2, 10));
pos += 10;

//Weapons
global.weapons[0].unlocked = true;
for (var i = 1; i < global.totalWeapons; i++) { //Skip weapon 0 (mega buster)
    global.weapons[i].unlocked = (string_copy(bin_pass, pos, 1) == "1");
    pos++;
}
//Defeated bosses are inferred from unlocked weapons
for (var i = 0; object_exists(i); i++) {
    if object_get_parent(i) == prtBoss {
        var boss = instance_create(0, 0, i);
        if boss.bossID > -1 and boss.weaponID > -1 {
            global.bossDefeated[boss.bossID] = boss.weaponID.unlocked;
        }
        with boss instance_destroy();
    }
}
//Items
for (var i = 1; i < array_length_1d(global.items); i++) {   //Skip item 0 (lives)
    var len = ceil(log2(global.items[i].maxUnits + 1));
    global.items[i].count = real(base_convert(string_copy(bin_pass, pos, len), 2, 10));
    for (var j = 0; j < global.items[i].count; j++) {
        with global.items[i] {
            event_user(1);
            event_user(4);
        }
    }
    pos += len;
}
