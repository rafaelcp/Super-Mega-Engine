//export double FMODSoundLoop(double sound, double paused)

//Loops a sound

//returns 0 on error
//retuns a sound instance on success
//paused is optional. set to true and unpause later to play. 
//If you hear a short blurb of sound after you start the sound, 
//because you are playing with the instance settings
//you might want to start it paused.

//sound = FMODSoundAdd("gunshot.wav");
//instance = FMODSoundLoop(sound);

//You dont need to keep track of the instance if you dont plan to change it
//The instance will be valid for as long as you dont stop it or stop the group
// or stop the entire system
//See also FMODInstanceSetLoopCount()
var t;
t =  external_call(global.dll_FMODSoundLoop,argument0,argument1);
//FMODUpdate();
return t;
