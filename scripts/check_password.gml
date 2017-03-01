//check_password(tern_pass)
var tern_pass = argument0;

var bin_pass = block_base_convert(tern_pass, 3, 2, 2, 3);

bin_pass = string_lpad(bin_pass, 96, "0");

//Change character to compute the correct password size
var charlen = ceil(log2(global.totalCharacters));
setPlayer(global.characters[real(base_convert(string_copy(bin_pass, 1, charlen), 2, 10))]);

var pass_size = password_size()
var base_pass = string_copy(bin_pass, 1, pass_size);
var checksum = string_copy(bin_pass, 1 + pass_size, 96 - pass_size);
var correct_checksum = password_checksum(base_pass);

print("bin pass", bin_pass, string_length(bin_pass), "base pass", base_pass, string_length(base_pass));

print("tern pass size", string_length(tern_pass), "password size", string_length(bin_pass), "base bin password size", pass_size, "checksum size", string_length(checksum), "correct checksum size", string_length(correct_checksum));
print("found checksum", checksum, "correct checksum", correct_checksum);

return checksum == correct_checksum;
