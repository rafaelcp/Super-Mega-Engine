//export double FMODSoundSetLoopPoints(double sound, double start, double end)
//returns 0 on error
//returns 1 on success
//Sets how the part of the sound that will be looped
// sound is the sound that was added
// start (0 to 1) is the position of the start of the loop
// end (0 to 1) is the position of the end of the loop
//this set the loop point from 40% to 60% so only that part is looped
//FMODSoundSetLoopPoints(global.musicsound,.4,.6);
//Call before playing the sound
return external_call(global.dll_FMODSoundSetLoopPoints,argument0,argument1,argument2);
