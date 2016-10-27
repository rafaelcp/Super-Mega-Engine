//makeLine(x1,y1,x2,y2)
assert(argument_count == 4, "makeLine has 4 input arguments.");
assert(is_real(argument0), "makeLine argument 0 must be a real number.");
assert(is_real(argument1), "makeLine argument 1 must be a real number.");
assert(is_real(argument2), "makeLine argument 2 must be a real number.");
assert(is_real(argument3), "makeLine argument 3 must be a real number.");

var line;
line[0] = argument0;
line[1] = argument1;
line[2] = argument2;
line[3] = argument3;

return line;
