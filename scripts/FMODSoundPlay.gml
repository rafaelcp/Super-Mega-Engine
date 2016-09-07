//export double FMODSoundPlay(double sound, double paused)

//Plays a sound... Finally

//returns 0 on error
//returns a sound instance on success
//paused is optional. set to true and unpause later to play. 
//If you hear a short blurb of sound after you start the sound, 
//because you are playing with the instance settings
//you might want to start it paused.

//sound = FMODSoundAdd("gunshot.wav");
//instance = FMODSoundPlay(sound);

//You dont need to keep track of the instance if you dont plan to change it
//or if the sound is short, you may never have time to use it other that right
//after you make the PlaySound Call... The instance will become invalid 
//when the sound is done playing
var t;
t =  external_call(global.dll_FMODSoundPlay,argument0,argument1);
//FMODUpdate();
return t;
