/// platesCollectedCount(): returns the number of collected plates
var count = 0;
for (var i = 0; object_exists(i); i++) {
    if object_get_parent(i) == prtPlateEquip and i.count > 0 {
        count++;
    }
}
return count;
