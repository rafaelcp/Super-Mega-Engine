//changeScene(scene_number, delay)
var scene_number = argument0;
var delay = argument1;

next_scene = scene_number + 1;

var fadeoutin = instance_create(0,0, objFadeIn);
with fadeoutin {
    deactivate = false;
    blackAlpha = 0;
    blackAlphaDecrease = -0.2;
    reverse = true;
}

if scene_number < 11 {
    alarm[scene_number + 1] = room_speed * delay;  //Default time for transitioning to next scene
}

show_debug_message("Scene " + string(next_scene) + ". Next one in " + string(alarm[scene_number + 1]/room_speed) + " seconds.");

