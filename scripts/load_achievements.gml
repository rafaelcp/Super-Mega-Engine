/// load_achievements()

var map = ds_map_secure_load('achievements.dat');

if map > -1 {
    //Write achievements' completion status
    for (var i = 0; object_exists(i); i++) {
        if object_get_parent(i) == prtAchievement {
            i.completed = ds_map_find_value(map, i.name);
            print("Loaded achievement " + i.name + " as " + iif(i.completed, "COMPLETED", "PENDING"));
        }
    }
}
