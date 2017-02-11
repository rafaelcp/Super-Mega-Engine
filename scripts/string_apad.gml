/// string_apad(str,length,padstr)
//
//  Returns a string padded to a certain length 
//  by inserting another string around it.
//  eg. string_apad("1234", 7, "0") == "0001234"
//
//      str         string of text, string
//      length      desired total length, real
//      padstr      padding, string
{
    var str = argument0;
    var length = argument1;
    var padstr = argument2;
    var len = string_length(str);
    var padlen = max(0,length - len);
    return string_rpad(string_lpad(str, len + padlen div 2, padstr), length, padstr);
}
