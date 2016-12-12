//password_checksum(bin_pass)
var bin_pass = argument0;

var max_pass = 96;
var pass_length = string_length(bin_pass);
var checksum_size = max_pass - pass_length;
var pass_dec = real(base_convert(bin_pass, 2, 10));
var checksum = dec_to_bin(abs(pass_dec ^ game_id), checksum_size);

return checksum;
