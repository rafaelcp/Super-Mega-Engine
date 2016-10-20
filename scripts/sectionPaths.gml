//sectionPaths(sectionRect)
var section = argument0;

var paths = ds_map_create();

ds_map_add(paths, "top", instanceInside(section[? "left"], section[? "top"], section[? "right"], section[? "bottom"], objSectionArrowUp) > -1);    
ds_map_add(paths, "right", instanceInside(section[? "left"], section[? "top"], section[? "right"], section[? "bottom"], objSectionArrowRight) > -1);    
ds_map_add(paths, "bottom", instanceInside(section[? "left"], section[? "top"], section[? "right"], section[? "bottom"], objSectionArrowDown) > -1);    
ds_map_add(paths, "left", instanceInside(section[? "left"], section[? "top"], section[? "right"], section[? "bottom"], objSectionArrowLeft) > -1);    

return paths;
