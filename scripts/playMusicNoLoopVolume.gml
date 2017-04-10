///playMusicNoLoopVolume(filename, volume)
//Plays music with a set volume. Volume should be between 0 and 1.
//Example: playMusicNoLoopVolume("CutMan.ogg", 0.6)

stopAllSFX();
var snd = noone;
if is_string(argument0) {
    var parts = split(argument0, ".");
    var name = ds_queue_dequeue(parts);
    var sound = asset_get_index("bgm" + name);
    if !audio_is_playing(sound) {
        snd = audio_play_sound(sound, 1, false);
    }
}
else if !audio_is_playing(argument0) {
    snd = audio_play_sound(argument0, 1, false);
}
if snd != noone {
    audio_sound_gain(snd, argument1, 0);
}
