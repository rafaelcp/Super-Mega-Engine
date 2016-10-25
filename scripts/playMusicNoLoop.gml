///playMusicNoLoop(filename)
//Plays music without looping it
//Example: playMusicNoLoop("CutMan.ogg")

audio_stop_all();
if is_string(argument0) {   //For retro compatibility
    var parts = split(argument0, ".");
    var name = ds_queue_dequeue(parts);
    audio_play_sound(asset_get_index("bgm" + name), 1, false);
}
else {
    audio_play_sound(argument0, 1, false);
}
