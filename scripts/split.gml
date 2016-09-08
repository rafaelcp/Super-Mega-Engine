/// ds_queue split(String s, [char delimiter]);
// Will only recognize double-quotation mark for block quotes, not single-quotation marks.
// You can pass a multiple-character string as the delimiter but it'll never get recognized
//      because string_char_at will never equal a multi-character delimiter.
 
var base=argument[0];                           // Base string
if (argument_count==1)
    var delimiter=",";
else
    var delimiter=argument[1];                  // Character to split around, default a comma
var inline=false;                               // inside a block quote?
var queue=ds_queue_create();                    // Contains the individual words
var tn="";                                      // temporary substring
 
base=base+delimiter;                            // lazy way of ensuring the last term in the list does not get skipped
 
for (var i=1; i<=string_length(base); i++){     // for each character in the string:
    var c=string_char_at(base, i);              //      Current character
    if (string_char_at(base, i-1)=="\"){        //      If the previous character is a backslash, bypass the other checks
        tn=string_copy(tn, 1, string_length(tn)-1);     // and remove the backslash
        tn=tn+c;
    } else if (c=='"'){                         //      If double quotation mark:
        if (inline){                            //          If already inside a block, end the block
            inline=false;
        } else {                                //          If not already inside a block, start a block
            inline=true;
        }
    } else if (c==delimiter&&!inline){          //      Delimiter met and not inside a block, enqueue and reset the substring
        ds_queue_enqueue(queue, tn);
        tn="";
    } else {                                    // Just an ordinary character, add it to the substring
        tn=tn+c;
    }
}
 
return queue;
