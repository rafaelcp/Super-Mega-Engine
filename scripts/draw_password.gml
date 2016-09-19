//draw_password(password)
var password = argument0;
var posx = 53;
var posy = 37;
var size = 16;
var offset = 3;
for (i = 0; i < 36; i++) {
    value = string_char_at(password, i + 1);
    row = i div 6;
    col = i mod 6;
    switch(value) {
        case "1": draw_sprite(reddot, 0, posx + col * size + offset, posy + row * size + offset); break;
        case "2": draw_sprite(bluedot, 0, posx + col * size + offset, posy+ row * size + offset); break;
    }
}
