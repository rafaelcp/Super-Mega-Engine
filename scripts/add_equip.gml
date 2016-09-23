//add_equip(equip_index)
var item_index = argument0;
if global.items[item_index].count < global.items[item_index].maxUnits {
    global.items[item_index].count++;
    playSFX(sfxImportantItem);
}
