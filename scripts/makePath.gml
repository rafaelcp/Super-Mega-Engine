//makePath(x1,y1,x2,y2,x3,y3,...)
var path = ds_list_create();
var prevX = 0;
var prevY = 0;
for (var i = 0; i < argument_count; i += 2) {
    var line = makeLine(prevX, prevY, argument[i], argument[i + 1]);
    ds_list_add(path, line);
    prevX = argument[i];
    prevY = argument[i + 1];
}
return path;
