//export double FMODAllStop(void)
//This stops all the sound and frees all the instances. Call this when the room ends

if (global.FMOD) return external_call(global.dll_FMODAllStop);
global.playingcustommusic = false;
