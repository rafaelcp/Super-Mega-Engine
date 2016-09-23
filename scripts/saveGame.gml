//saveGame(id)
var map = ds_map_create();
map[? "lives"] = global._lives;
map[? "screws"] = global.screws;
for(var i = 0; i < 8; i++) {
    map[? ("bossDefeated" + string(i))] = global.bossDefeated[i];
}
for (var i = 0; i < global.totalWeapons; i++) {
    map[? ("weaponUnlocked" + string(i))] = global.weaponUnlocked[i];
}
for (var i = 0; i < array_length_1d(global.items); i++) {
    map[? ("itemCount" + string(i))] = global.items[i].count;
}
ds_map_secure_save(map, "save" + string(argument0) + ".dat");
show_debug_message("Game saved.");
