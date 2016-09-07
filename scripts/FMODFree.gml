//export double FMODfree(void)

//Frees fmods allocated resources and stops the sound system
//You must call FMODinit(); if you want to use the system again
//You should free all you sounds before calling this function 
//(unless you are quiting the game), In which case it does not matter.

//FMODfree();

//See also
//FMODinit()
//FMODAllStop()
//FMODSoundFree()
//UnloadFMOD()

return external_call(global.dll_FMODfree);
