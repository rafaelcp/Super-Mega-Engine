/// string_rpad(str,length,padstr)
//
//  Returns a string padded to a certain length 
//  by inserting another string to its right.
//  eg. string_rpad("1234", 7, "0") == "0001234"
//
//      str         string of text, string
//      length      desired total length, real
//      padstr      padding, string
{
    var str,len,pad,padsize,padding,out;
    str = argument0;
    len = argument1;
    pad = argument2;
    padsize = string_length(pad);
    padding = max(0,len - string_length(str));
    out = str;
    out  += string_repeat(pad,padding div padsize);
    out += string_copy(pad,1,padding mod padsize);
    out  = string_copy(out,1,len);
    return out;
}
