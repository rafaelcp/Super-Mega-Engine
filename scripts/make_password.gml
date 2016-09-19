//make_password()
bin_pass = "";
//If you don't want something to be stored in the password, just comment the line
bin_pass += dec_to_bin(global._lives);
bin_pass += dec_to_bin(global.screws);
bin_pass += dec_to_bin(global.eTanks);
bin_pass += dec_to_bin(global.mTanks);
for(var i = 0; i < 8; i++) {
    bin_pass += iif(global.bossDefeated[i], "1", "0");
}
for (var i = 0; i <= global.totalWeapons; i++) {
    bin_pass += iif(global.weaponUnlocked[i], "1", "0");
}
tern_pass = string_lpad(base_convert(bin_pass, 2, 3), 36, "0");
return tern_pass;
