/// gamepad_button_check_any(button)
var button = argument0;

var gp_num = gamepad_get_device_count();
var result = false;
for (var i = 0; i < gp_num; i++) {
    if gamepad_is_connected(i) {
        result = result || gamepad_button_check(i, button);
    }
}
return result;
