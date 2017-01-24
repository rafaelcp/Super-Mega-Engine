/// refillHealthBar(): nullifies effects of death and starts a new phase

control = instance_nearest(x, y, objBossControl);
control.canFillHealthBar = true;
global.bossHealth = 1;
healthpoints = 1;
dead = false;
canInitDeath = false;
playerLockMovement();
with prtEnemyProjectile {
    instance_destroy();
}
with prtPlayerProjectile {
    instance_destroy();
}
