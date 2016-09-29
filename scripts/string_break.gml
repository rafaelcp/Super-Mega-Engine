//string_break(str, n)
var str = argument0;
var n = argument1;

var words = split(str, " ");
var line = "";
var result = "";

while !ds_queue_empty(words) {
    var word = ds_queue_dequeue(words);
    if string_length(line + " " + word) >= n {
        result += line + "##";
        line = "";
    }
    if string_length(line) > 0 {
        line += " ";
    }
    line += word;
}
result += line;
return result;
