//loadGame(id)
var map = ds_map_secure_load("save" + string(argument0) + ".dat");
global._lives = map[? "lives"];
global.screws = map[? "screws"];
global.eTanks = map[? "eTanks"];
global.mTanks = map[? "mTanks"];
for(i = 0; i < 8; i++) {
     global.bossDefeated[i] = map[? ("bossDefeated" + string(i))];
}
