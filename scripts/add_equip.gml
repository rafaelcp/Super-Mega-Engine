//add_equip(equip_index)
var item_index = argument0;
if item_index.count < item_index.maxUnits {
    item_index.count++;
    with item_index event_user(4);
    playSFX(sfxImportantItem);
}
