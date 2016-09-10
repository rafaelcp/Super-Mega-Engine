//saveGame(id)
var map = ds_map_create();
map[? "lives"] = global._lives;
map[? "screws"] = global.screws;
map[? "eTanks"] = global.eTanks;
map[? "mTanks"] = global.mTanks;
for(i = 0; i < 8; i++) {
    map[? ("bossDefeated" + string(i))] = global.bossDefeated[i];
}
ds_map_secure_save(map, "save" + string(argument0) + ".dat");
