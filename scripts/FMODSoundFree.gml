//export double FMODSoundFree(double sound)
//This function frees a sound from memory
//You shoud do this when the game ends though it's not required
//You should definitivelly do this if you added a temporary sound
//to the system and no longer need it. Otherwise, you may end up using 
//to much memory such as when playing a tempprary sound from file

//FMODSoundFree(global.gunshot);
//global.gunshot = 0; //this prevents from accidently using the sound

//returns 0 on error (sound is being played by an instance)
//return 1 on success 

//Dont forget to stop the instance or the group or all instances before calling this

//See also
//FMODSoundAdd()
//FMODInstanceStop()
//FMODGroupStop()
//FMODAllStop()


return external_call(global.dll_FMODSoundFree,argument0);
