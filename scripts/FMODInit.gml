//export double FMODinit(double maxsounds, double supportwebmusic)
//maxsounds is the maximum number of concurrent sound instances playing

//Initiates the FMOD sound system
//Call at the beggining of the game, after you called LoadFMOD()

//LoadFMOD()
//FMODinit(100);

//You can then start adding sounds to the system
//See Also
//LoadFMOD()
//FMODfree()
//FMODSoundAdd()

//to play web music, you must initialise the system like so
//FMODinit(100,true);
//Password encription is no longer supperted if you use the web music option

return external_call(global.dll_FMODinit,argument0, argument1);
