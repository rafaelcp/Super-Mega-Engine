//draw_password(password)
var password = argument0;
var posx = 23;
var posy = 19;
var size = 16;
var offset = 3;
for (i = 0; i < 64; i++) {
    var value = string_char_at(password, i + 1);
    var row = i div 8;
    var col = i mod 8;
    switch(value) {
        case "1": draw_sprite(reddot, 0, posx + col * size + offset, posy + row * size + offset); break;
        case "2": draw_sprite(bluedot, 0, posx + col * size + offset, posy+ row * size + offset); break;
    }
}
