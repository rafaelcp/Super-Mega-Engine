//export double FMODAllStop(void)
//This stops all the sound and frees all the instances. Call this when the room ends

return external_call(global.dll_FMODAllStop);
global.playingcustommusic = false;
