/// refillHealthBar(): nullifies effects of death and starts a new phase

control = instance_nearest(x, y, objBossControl);
control.canFillHealthBar = true;
global.bossHealth = 0;
healthpoints = 0;
dead = false;
canInitDeath = false;
playerLockMovement();
with prtEnemyProjectile {
    instance_destroy();
}
with prtPlayerProjectile {
    instance_destroy();
}
