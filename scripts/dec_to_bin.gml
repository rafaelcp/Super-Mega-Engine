/// dec_to_bin(dec, [size])
//
//  Returns a string of binary digits (1 bit each)
//  representing the given decimal integer.
//
//      dec         non-negative integer, real
//
/// GMLscripts.com/license
{
    var dec, bin;
    var size = 8;
    if argument_count > 1 {
        size = argument1;
    }
    dec = argument0;
    if (dec) bin = "" else bin="0";
    while (dec) {
        bin = string_char_at("01", (dec & 1) + 1) + bin;
        dec = dec >> 1;
        if string_length(bin) >= size {
            break;
        }
    }
    return string_lpad(bin, size, "0");
}
