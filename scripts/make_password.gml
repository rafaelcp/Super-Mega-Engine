//make_password()
var bin_pass = bin_base_password();

var max_pass = 96;
var checksum = password_checksum(bin_pass);
bin_pass += checksum;
bin_pass = string_copy(bin_pass, 1, max_pass);

assert(string_length(bin_pass) == max_pass, "Invalid Password");

tern_pass = string_lpad(base_convert(bin_pass, 2, 3), 64, "0");
return tern_pass;
