//make_password()
var bin_pass = bin_base_password();

print(bin_pass);

var max_pass = 96;
var checksum = password_checksum(bin_pass);
bin_pass += checksum;
bin_pass = string_copy(bin_pass, 1, max_pass);

print(bin_pass);

assert(string_length(bin_pass) == max_pass, "Invalid Password");

var tern_pass = string_lpad(block_base_convert(bin_pass, 2, 3, 3, 2), 64, "0");

return tern_pass;
