///playMusicNoLoopVolume(filename, volume)
//Plays music with a set volume. Volume should be between 0 and 1.
//We're using the FMOD sound system, which means all music must be stored externally
//Preferably, use the .ogg format, since this takes much less disk space than .mp3 or .wav

//Example: playMusicNoLoopVolume("CutMan.ogg", 0.6)

FMODAllStop();

if global.msc != -2
    FMODSoundFree(global.msc);

var mscPlay;

global.msc = FMODSoundAdd(argument0, false, true);
mscPlay = FMODSoundPlay(global.msc, false);
FMODInstanceSetVolume(mscPlay, argument1);
