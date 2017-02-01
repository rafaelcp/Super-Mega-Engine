//add_equip(equip_index)
var item_index = argument0;
if item_index.count < item_index.maxUnits {
    item_index.count++;
    playSFX(sfxImportantItem);
}
