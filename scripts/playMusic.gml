///playMusic(filename)
//Plays music
//We're using the FMOD sound system, which means all music must be stored externally
//Preferably, use the .ogg format, since this takes much less disk space than .mp3 or .wav

//Example: playMusic("CutMan.ogg")

FMODAllStop();

if global.msc != -2
    FMODSoundFree(global.msc);

var mscPlay;

global.msc = FMODSoundAdd(argument0, false, true);
mscPlay = FMODSoundLoop(global.msc, false);
