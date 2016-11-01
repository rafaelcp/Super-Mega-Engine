/// drawSpriteColorSwap(spr, subimg, sx, sy, src_col1, src_col2, src_col3, col1, col2, col3)
/// Draw sprite replacing colors

var spr = argument0;
var subimg = argument1;
var sx = argument2;
var sy = argument3;

var src_col1 = argument4;
var src_col2 = argument5;
var src_col3 = argument6;

var col1 = argument7;
var col2 = argument8;
var col3 = argument9;

shader_set(shColorReplace3);

var shader_params;

//Primary Color
shader_params = shader_get_uniform(shColorReplace3, "colorIn1");
shader_set_uniform_f(shader_params, color_get_red(src_col1) / 255.0, color_get_green(src_col1) / 255.0, color_get_blue(src_col1) / 255.0, 1.0);
shader_params = shader_get_uniform(shColorReplace3, "colorOut1");
shader_set_uniform_f(shader_params, color_get_red(col1) / 255.0, color_get_green(col1) / 255.0, color_get_blue(col1) / 255.0, 1.0);

//Secondary Color
shader_params = shader_get_uniform(shColorReplace3, "colorIn2");
shader_set_uniform_f(shader_params, color_get_red(src_col2) / 255.0, color_get_green(src_col2) / 255.0, color_get_blue(src_col2) / 255.0, 1.0);
shader_params = shader_get_uniform(shColorReplace3, "colorOut2");
shader_set_uniform_f(shader_params, color_get_red(col2) / 255.0, color_get_green(col2) / 255.0, color_get_blue(col2) / 255.0, 1.0);

//Third Color
shader_params = shader_get_uniform(shColorReplace3, "colorIn3");
shader_set_uniform_f(shader_params, color_get_red(src_col3) / 255.0, color_get_green(src_col3) / 255.0, color_get_blue(src_col3) / 255.0, 1.0);
shader_params = shader_get_uniform(shColorReplace3, "colorOut3");
shader_set_uniform_f(shader_params, color_get_red(col3) / 255.0, color_get_green(col3) / 255.0, color_get_blue(col3) / 255.0, 1.0);

draw_sprite(spr, subimg, sx, sy);

shader_reset();
