//export double FMODInstanceStop(double instance)

//Use this to stop and free an instance when done with a 
//looped instance for example

if (global.FMOD) return external_call(global.dll_FMODInstanceStop,argument0);
