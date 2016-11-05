///numRushBossesDefeated()
var n = 0;
for (var i = 0; i < 8; i++) {
    if global.bossRushDefeated[i] {
        n++;
    }
}
return n;
