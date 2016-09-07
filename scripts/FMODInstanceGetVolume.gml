//export double FMODInstanceGetVolume(double instance)

//Get the instance volume. It must be playing (valid) or you will get 0

return external_call(global.dll_FMODInstanceGetVolume,argument0);
