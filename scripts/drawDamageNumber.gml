///drawDamageNumber(position x, position y, int amount)
//THIS SCRIPT DISPLAYS A DAMAGE NUMBER OVER A X AND Y COORDINATE.

// If display damage numbers is not enabled, return early.
if (!global.enableDamageNumbers)
{
    return 0;
}


damageString = instance_create(argument0, argument1, objDmgText);
damageString.vspeed = -1*random_range(1, 3);
damageString.hspeed = choose(-1, 1) * random_range(1, 2);
damageString.damageValue = argument2;
