//export double FMODInstanceGetVolume(double instance)

//Get the instance volume. It must be playing (valid) or you will get 0

if (global.FMOD) return external_call(global.dll_FMODInstanceGetVolume,argument0);
