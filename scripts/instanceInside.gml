//instanceInside(left, top, right, bottom, obj)
var left = argument0;
var top = argument1;
var right = argument2;
var bottom = argument3;
var obj = argument4;

var n = instance_number(obj);

for (var i = 0; i < n; i++) {
    var instance = instance_find(obj, i);
    if instance.x >= left && instance.x <= right && instance.y >= top && instance.y <= bottom {
        return instance;
    }
}

return -1;
