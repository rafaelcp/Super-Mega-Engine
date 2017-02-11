///block_base_convert(input, base_from, base_to, block_size_from, block_size_to)
var input = argument0;
var base_from = argument1;
var base_to = argument2;
var block_size_from = argument3;
var block_size_to = argument4;

var result = "";
var size = string_length(input);

for (var i = 0; i < size; i += block_size_from) {
    result += string_lpad(base_convert(string_copy(input, i + 1, block_size_from), base_from, base_to), block_size_to, "0")
}

return result;
