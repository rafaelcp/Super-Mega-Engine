/// drawSave(id, map, selected)
var save_id = argument0;
var map = argument1;
var selected = argument2;

var margin = 30;
var top = 30;
var spacing = 2;
var height = 48;
var x1 = margin;
var y1 = save_id * (height + spacing) + top;
var x2 = room_width - margin;
var y2 = y1 + height;

if selected {
    draw_set_colour(c_white);
}
else {
    draw_set_colour(c_gray);
}

draw_rectangle(x1, y1, x2, y2, true);

draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_set_font(global.font);
draw_text(x1 + 3, y1 + 3, "DATA " + string(save_id + 1));

if map > -1 {

    if !selected {
        shader_set(shGrayscale);
    }
    
    //Draw Screws
    if cfgEnableScrews {
        draw_text(room_width - margin - 26, y2 - 10, string_lpad(string(map[? "screws"]),3,"0"));
        draw_sprite_ext(sprScrewBig, 0, room_width - margin - 28 - 8, y2 - 12, 0.5, 0.5, 1, c_white, 1);
    }
    
    //Draw Weapons
    for (var i = 0; i < global.totalWeapons; i++) {
        if map[? ("weaponUnlocked" + string(i))] {
            draw_sprite_ext(sprWeaponIconsColor, i, x1 + 4 + i * 8, y1 + 14, 0.5, 0.5, 1, c_white, 1); 
        }
    }
    
    //Draw Items
    for (var i = 0; i < array_length_1d(global.items); i++) {
        var count = map[? ("itemCount" + string(i))];
        if i == 0 { //Lives
            count = map[? "lives"];
        }
        if count > 0 || i == 0 {
            draw_sprite_ext(global.items[i].sprite_index, 0, x1 + 4 + i * 8, y1 + 28, 0.5, 0.5, 1, c_white, 1);
            if global.items[i].showCount {
                draw_text(x1 + 4 + i * 8, y1 + 38, string(count));
            }
        }
    }    
    
    if !selected {
        shader_reset();
    }
    
}
else {
    draw_set_halign(fa_center);
    draw_text(room_width / 2, y1 + 3 + height / 2, "EMPTY");
}
