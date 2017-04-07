///deactivateUnimportantObjects()
//Deactivates umimportant objects. Even deactivates objects inside the section

instance_deactivate_all(true);

//Add more important objects as they are added
instance_activate_object(prtPlayer);
instance_activate_object(objGlobalControl);
instance_activate_object(objHealthWeaponBar);

instance_activate_object(objBossDoor);
instance_activate_object(objBossDoorH);


//Objects that should remain activated, but without animation (disabled animation code is in the object itself)
instance_activate_object(objMM2Conveyor);


//Objects that destroy themselves off screen
//Though, when switching sections they should not be visible
if !instance_exists(objSectionSwitcher)
{
    instance_activate_object(prtPlayerProjectile);
    instance_activate_object(prtEnemyProjectile);
    instance_activate_object(objReflectedProjectile);
    instance_activate_object(prtEffect);
    instance_activate_object(prtRush);
    instance_activate_object(objRushJet); //Could not be parented to prtRush since it's parented to prtMovingPlatformSolid
    instance_activate_object(prtPickup);
    
    //Objects that have different code off-screen
    instance_activate_object(prtEnemy);
    instance_activate_object(prtGimmick);
    instance_activate_object(objBossControl);
}

instance_activate_object(prtMovingPlatformSolid);   //Moving platforms with keepOnSwitch should be kept visibile and moving
var count = instance_number(prtMovingPlatformSolid);
for (var i = 0; i < count; i++) {
    var obj = instance_find(prtMovingPlatformSolid, i);
    if obj != noone && instance_exists(obj) && !obj.keepOnSwitch {
        instance_deactivate_object(obj);
    }
}
instance_activate_object(prtEquip);
instance_activate_object(prtWeapon);
instance_activate_object(prtAchievement);
