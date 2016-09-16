///playMusicNoLoop(filename)
//Plays music without looping it
//Example: playMusicNoLoop("CutMan.ogg")

audio_stop_all();
var parts = split(argument0, ".");
var name = ds_queue_dequeue(parts);
audio_play_sound(asset_get_index("bgm" + name), 1, false);

