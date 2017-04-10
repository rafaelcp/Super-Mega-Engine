///playMusic(filename, loop start, loop end)
//Plays music and loops from one point to another point
//loop start and loop end should be between 0 and 1 (0 being 0:00 and 1 being the end of the music)
//Example: playMusic("CutMan.ogg", 0.4, 0.8)

stopAllSFX();
var snd = noone;
if is_string(argument0) {   //For retro compatibility
    var parts = split(argument0, ".");
    var name = ds_queue_dequeue(parts);
    var sound = asset_get_index("bgm" + name);
    if !audio_is_playing(sound) {
        snd = audio_play_sound(sound, 1, true);
    }
}
else if !audio_is_playing(argument0) {
    snd = audio_play_sound(argument0, 1, true);
}
if snd != noone {
    var len = audio_sound_length(snd);
    global.loopStart = argument1 * len;
    global.loopEnd = argument2 * len;
    global.bgm = snd;
}
