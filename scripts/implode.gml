/// implode(delimiter,array)
//
//  Returns a string of elements from a given array
//  of strings and separated by a delimiter.
//
//      delimiter   delimiter character, string
//      array       group of elements, array
//
/// GMLscripts.com/license
{
    var del = argument0;
    var arr = argument1;
    var out = "";
    var ind = 0;
    var num = array_length_1d(arr);
    repeat (num-1) {
        out += arr[ind] + del;
        ind++;
    }
    out += arr[ind];
    return out;
}
