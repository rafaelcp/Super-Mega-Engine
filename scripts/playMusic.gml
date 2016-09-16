///playMusic(filename)
//Plays music
//Example: playMusic("CutMan.ogg")

audio_stop_all();
var parts = split(argument0, ".");
var name = ds_queue_dequeue(parts);
audio_play_sound(asset_get_index("bgm" + name), 1, true);
