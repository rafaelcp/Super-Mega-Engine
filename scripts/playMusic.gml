///playMusic(filename)
//Plays music
//Example: playMusic("CutMan.ogg")

stopAllSFX();
if is_string(argument0) {   //For retro compatibility
    var parts = split(argument0, ".");
    var name = ds_queue_dequeue(parts);
    audio_play_sound(asset_get_index("bgm" + name), 1, true);
}
else {
    audio_play_sound(argument0, 1, true);
}
