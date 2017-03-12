/// load_configs()

var map = ds_map_secure_load('config.dat');

if map > -1 {

    //Keys
    global.leftKey = ds_map_find_value(map, 'leftKey');
    global.rightKey = ds_map_find_value(map, 'rightKey');
    global.upKey = ds_map_find_value(map, 'upKey');
    global.downKey = ds_map_find_value(map, 'downKey');
    global.jumpKey = ds_map_find_value(map, 'jumpKey');
    global.shootKey = ds_map_find_value(map, 'shootKey');
    global.slideKey = ds_map_find_value(map, 'slideKey');
    global.pauseKey = ds_map_find_value(map, 'pauseKey');
    global.selectKey = ds_map_find_value(map, 'selectKey');
    global.weaponSwitchLeftKey = ds_map_find_value(map, 'weaponSwitchLeftKey');
    global.weaponSwitchRightKey = ds_map_find_value(map, 'weaponSwitchRightKey');
    
    //Buttons
    global.leftButton = ds_map_find_value(map, 'leftButton');
    global.rightButton = ds_map_find_value(map, 'rightButton');
    global.upButton = ds_map_find_value(map, 'upButton');
    global.downButton = ds_map_find_value(map, 'downButton');
    global.jumpButton = ds_map_find_value(map, 'jumpButton');
    global.shootButton = ds_map_find_value(map, 'shootButton');
    global.slideButton = ds_map_find_value(map, 'slideButton');
    global.pauseButton = ds_map_find_value(map, 'pauseButton');
    global.selectButton = ds_map_find_value(map, 'selectButton');
    global.weaponSwitchLeftButton = ds_map_find_value(map, 'weaponSwitchLeftButton');
    global.weaponSwitchRightButton = ds_map_find_value(map, 'weaponSwitchRightButton');

}
