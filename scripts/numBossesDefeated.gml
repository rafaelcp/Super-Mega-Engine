//numBossedDefeated()
var n = 0;
for (var i = 0; i < 8; i++) {
    if global.bossDefeated[i] {
        n++;
    }
}
return n;
