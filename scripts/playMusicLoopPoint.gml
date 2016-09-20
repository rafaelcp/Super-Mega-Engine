///playMusic(filename, loop start, loop end)
//Plays music and loops from one point to another point
//loop start and loop end should be between 0 and 1 (0 being 0:00 and 1 being the end of the music)
//We're using the FMOD sound system, which means all music must be stored externally
//Preferably, use the .ogg format, since this takes much less disk space than .mp3 or .wav

//Example: playMusic("CutMan.ogg", 0.4, 0.8)

FMODAllStop();

if global.msc != -2
    FMODSoundFree(global.msc);

var mscPlay;

global.msc = FMODSoundAdd(argument0, false, true);
FMODSoundSetLoopPoints(global.msc, argument1, argument2);

mscPlay = FMODSoundLoop(global.msc, false);
