///password_checksum(bin_pass)
var bin_pass = argument0;

var max_pass = 96;
var pass_length = string_length(bin_pass);
var checksum_size = max_pass - pass_length;
var sum = string_count("1", bin_pass + dec_to_bin(abs(game_id),checksum_size));

print("pass length", pass_length, "checksum size", checksum_size, "sum", sum);

var checksum = dec_to_bin(abs(sum), checksum_size);

print("game id", game_id, "binary checksum", checksum);

return checksum;
