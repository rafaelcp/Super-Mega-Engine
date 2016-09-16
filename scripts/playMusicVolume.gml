///playMusicVolume(filename, volume)
//Plays music with a set volume. Volume should be between 0 and 1.
//Example: playMusicVolume("CutMan.ogg", 0.6)

audio_stop_all();
var parts = split(argument0, ".");
var name = ds_queue_dequeue(parts);
var snd = audio_play_sound(asset_get_index("bgm" + name), 1, true);
audio_sound_gain(snd, argument1, 0);
