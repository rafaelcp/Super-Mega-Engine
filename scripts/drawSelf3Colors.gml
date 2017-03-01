/// drawSelf3Colors(col1, col2, col3)
/// Draw sprite replacing MM colors (blue, cyan and black) by others
var col1 = argument0;
var col2 = argument1;
var col3 = argument2;

shader_set(shColorReplace3);

var shader_params;

//Primary Color
shader_params = shader_get_uniform(shColorReplace3, "colorIn1");
shader_set_uniform_f(shader_params, colour_get_red(global.charPrimaryColor) / 255.0, colour_get_green(global.charPrimaryColor) / 255.0, colour_get_blue(global.charPrimaryColor) / 255.0, 1.0);
shader_params = shader_get_uniform(shColorReplace3, "colorOut1");
shader_set_uniform_f(shader_params, color_get_red(col1) / 255.0, color_get_green(col1) / 255.0, color_get_blue(col1) / 255.0, 1.0);

//Secondary Color
shader_params = shader_get_uniform(shColorReplace3, "colorIn2");
shader_set_uniform_f(shader_params, colour_get_red(global.charSecondaryColor) / 255.0, colour_get_green(global.charSecondaryColor) / 255.0, colour_get_blue(global.charSecondaryColor) / 255.0, 1.0);
shader_params = shader_get_uniform(shColorReplace3, "colorOut2");
shader_set_uniform_f(shader_params, color_get_red(col2) / 255.0, color_get_green(col2) / 255.0, color_get_blue(col2) / 255.0, 1.0);

//Outline
shader_params = shader_get_uniform(shColorReplace3, "colorIn3");
shader_set_uniform_f(shader_params, 1.0 / 255.0, 1.0 / 255.0, 1.0 / 255.0, 1.0);
shader_params = shader_get_uniform(shColorReplace3, "colorOut3");
shader_set_uniform_f(shader_params, color_get_red(col3) / 255.0, color_get_green(col3) / 255.0, color_get_blue(col3) / 255.0, 1.0);

drawSelf();

shader_reset();
