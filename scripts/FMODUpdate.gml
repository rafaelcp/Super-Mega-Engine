//export double FMODUpdate3dPositions()
//You must call this once every step to update system
//In a controller object end step event
//FMODUpdate();
if (global.FMOD) return external_call(global.dll_FMODUpdate);
