/// gamepad_axis_value_any(axis)
var axis = argument0;

var gp_num = gamepad_get_device_count();
var maximum = 0;
for (var i = 0; i < gp_num; i++) {
    if gamepad_is_connected(i) {
        var value = gamepad_axis_value(i, axis);
        if abs(value) > abs(maximum) {
            maximum = value;
        }
    }
}
return maximum;
