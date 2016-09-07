///playerDeactivateObjects()
//Deactivates umimportant objects outside the current section

deactivateUnimportantObjects(); //Can be found under Views

//The -16/+16 is to also activate solids on the left/top; when switching sections, we want to check these, and disallow switching if they are there to avoid getting stuck
instance_activate_region(sectionLeft-16, sectionTop-16, abs(sectionRight - sectionLeft)+16, abs(sectionBottom - sectionTop)+16, true);
