///stopSFX(index)
//Stops a sound effect

if audio_system() == audio_old_system {
    sound_stop(argument0);
}
else {
    audio_stop_sound(argument0);
}
