//bin_base_password()
bin_pass = "";
//If you don't want something to be stored in the password, just comment the line
print("char bits", ceil(log2(global.totalCharacters)), "char", global.charIndices[global.character]);
bin_pass += dec_to_bin(global.charIndices[global.character], ceil(log2(global.totalCharacters)));
bin_pass += dec_to_bin(global._lives, 4);
bin_pass += dec_to_bin(global.screws, 10);

for (var i = 1; i < global.totalWeapons; i++) { //Skip weapon 0 (mega buster)
    bin_pass += iif(global.weapons[i].unlocked, "1", "0");
}
for (var i = 1; i < array_length_1d(global.items); i++) {   //Skip item 0 (lives)
    bin_pass += dec_to_bin(global.items[i].count, ceil(log2(global.items[i].maxUnits + 1)));
}

return bin_pass;
