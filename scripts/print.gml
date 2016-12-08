/// print(variables or strings)

var output_string = "";

for (var i = 0; i < argument_count; i++) {
    output_string += string(argument[i]) + " ";
}

show_debug_message(output_string);
