//export double FMODInstanceSetVolume(double instance, double volume)
//returns 0 on error
//returns 1 on success

//instance is the sound instance gotten with FMODSoundPlay
//volume is the volume 0 to 1

//Use this to change an sound instance volume

//The instance will never be louder than the max sound volume
//Other volume controls exist in the game, the global, the group and the distance (if 3d)
//the overall volume is a combination of all of those
// overall = maxvalue*instancevalue*group*global*distancefactor

//sound = FMODSoundAdd("gunshot.wav");
//FMODSoundSetMaxVolume(sound,.5);
//instance = FMODSoundLoop(sound);
//FMODInstanceSetVolume(instance,.5);
//You can use this to implement your fade system
//You need to keep track of the volume yourself in a variable 
//if you need to remember the max volume of the intance

return external_call(global.dll_FMODInstanceSetVolume,argument0,argument1);
