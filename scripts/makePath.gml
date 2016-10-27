//makePath(x1,y1,x2,y2,x3,y3,...)
assert(argument_count > 0 && argument_count % 2 == 0, "makePath must receive an even number of real number arguments.");

var path = ds_list_create();
var prevX = 0;
var prevY = 0;
for (var i = 0; i < argument_count; i += 2) {
    assert(is_real(argument[i]), "makePath argument " + string(i) + " must be a real number.");
     
    var line = makeLine(prevX, prevY, argument[i], argument[i + 1]);
    ds_list_add(path, line);
    prevX = argument[i];
    prevY = argument[i + 1];
}

return path;
