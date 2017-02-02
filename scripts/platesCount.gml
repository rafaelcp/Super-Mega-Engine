/// platesCount(): returns the total number of plates in the game
var count = 0;
for (var i = 0; object_exists(i); i++) {
    if object_get_parent(i) == prtPlateEquip {
        count++;
    }
}
return count;
