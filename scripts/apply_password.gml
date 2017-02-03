//apply_password(tern_pass)
var tern_pass = argument0;
var bin_pass = base_convert(tern_pass, 3, 2);
bin_pass = string_lpad(bin_pass, 96, "0");

var pos = 1;

global._lives = real(base_convert(string_copy(bin_pass, pos, 4), 2, 10));
pos += 4;
global.screws = real(base_convert(string_copy(bin_pass, pos, 10), 2, 10));
pos += 10;

for(var i = 0; i < 8; i++) {
    global.bossDefeated[i] = (string_copy(bin_pass, pos, 1) == "1");
    pos++;
}
for (var i = 0; i < global.totalWeapons; i++) {
    global.weapons[i].unlocked = (string_copy(bin_pass, pos, 1) == "1");
    pos++;
}
for (var i = 0; i < array_length_1d(global.items); i++) {
    global.items[i].count = real(base_convert(string_copy(bin_pass, pos, 4), 2, 10));
    for (var j = 0; j < global.items[i].count; j++) {
        with global.items[i] {
            event_user(1);
            event_user(4);
        }
    }
    pos += 4;
}
