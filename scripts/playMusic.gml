///playMusic(filename)
//Plays music
//Example: playMusic("CutMan.ogg")

stopAllSFX();
if is_string(argument0) {   //For retro compatibility
    var parts = split(argument0, ".");
    var name = ds_queue_dequeue(parts);
    var sound = asset_get_index("bgm" + name);
    if !audio_is_playing(sound) {
        audio_play_sound(sound, 1, true);
    }
}
else if !audio_is_playing(argument0) {
    audio_play_sound(argument0, 1, true);
}
