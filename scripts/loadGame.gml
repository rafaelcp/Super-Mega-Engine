//loadGame(id)
var map = ds_map_secure_load("save" + string(argument0) + ".dat");
setPlayer(map[? "character"]);
global._lives = map[? "lives"];
global.screws = map[? "screws"];
for(i = 0; i < 8; i++) {
     global.bossDefeated[i] = map[? ("bossDefeated" + string(i))];
}
for (var i = 0; i < global.totalWeapons; i++) {
    global.weapons[i].unlocked = map[? ("weaponUnlocked" + string(i))];
}
for (var i = 0; i < array_length_1d(global.items); i++) {
    global.items[i].count = map[? ("itemCount" + string(i))];
    for (var j = 0; j < global.items[i].count; j++) {
        with global.items[i] {
            event_user(1);
            event_user(4);
        }
    }
}
show_debug_message("Game loaded.");
