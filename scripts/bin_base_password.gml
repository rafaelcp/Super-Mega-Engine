//bin_base_password()
bin_pass = "";
//If you don't want something to be stored in the password, just comment the line
bin_pass += dec_to_bin(global._lives, 4);
bin_pass += dec_to_bin(global.screws, 10);

for(var i = 0; i < 8; i++) {
    bin_pass += iif(global.bossDefeated[i], "1", "0");
}
for (var i = 0; i < global.totalWeapons; i++) {
    bin_pass += iif(global.weapons[i].unlocked, "1", "0");
}
for (var i = 0; i < array_length_1d(global.items); i++) {
    bin_pass += dec_to_bin(global.items[i].count, 4);
}

return bin_pass;
