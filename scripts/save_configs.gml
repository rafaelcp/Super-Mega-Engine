/// save_configs()

var map = ds_map_create();

//Keys
ds_map_add(map, 'leftKey', global.leftKey);
ds_map_add(map, 'rightKey', global.rightKey);
ds_map_add(map, 'upKey', global.upKey);
ds_map_add(map, 'downKey', global.downKey);
ds_map_add(map, 'jumpKey', global.jumpKey);
ds_map_add(map, 'shootKey', global.shootKey);
ds_map_add(map, 'slideKey', global.slideKey);
ds_map_add(map, 'pauseKey', global.pauseKey);
ds_map_add(map, 'selectKey', global.selectKey);
ds_map_add(map, 'weaponSwitchLeftKey', global.weaponSwitchLeftKey);
ds_map_add(map, 'weaponSwitchRightKey', global.weaponSwitchRightKey);

//Buttons
ds_map_add(map, 'leftButton', global.leftButton);
ds_map_add(map, 'rightButton', global.rightButton);
ds_map_add(map, 'upButton', global.upButton);
ds_map_add(map, 'downButton', global.downButton);
ds_map_add(map, 'jumpButton', global.jumpButton);
ds_map_add(map, 'shootButton', global.shootButton);
ds_map_add(map, 'slideButton', global.slideButton);
ds_map_add(map, 'pauseButton', global.pauseButton);
ds_map_add(map, 'selectButton', global.selectButton);
ds_map_add(map, 'weaponSwitchLeftButton', global.weaponSwitchLeftButton);
ds_map_add(map, 'weaponSwitchRightButton', global.weaponSwitchRightButton);

ds_map_secure_save(map, 'config.dat');
