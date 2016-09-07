//export double FMODSoundAdd(LPCSTR soundfile, double threed, double streamed)

//Adds a sound resource in the system but does not play it
//returns a soundid which you should store in a variable
//in order to play it and free it later
//returns 0 on error

//threed (optional false is default) specifies to load the file as 3d enabled
//stream (optional false is default) specifies the system to load the file a chunk at a time to play it

// specify threed as true if the sound will be 3d enabled
// You cannot mix 3d functions with non 3d sounds

//you can load up your sounds at the beginning of the game
//and store them in a global array or variable

//global.gunshot = FMODSoundAdd("gunshot.wav");
//or
//global.gunshot = FMODSoundAdd("gunshot.wav", true); //for 3d
//you free the sound when the game ends with FMODSoundFree(sound)
//you play the sound with FMODSoundPlay(sound)

//NOTE. Stream any single instance playing large files to save on memory
//If you choose to stream a files, it WILL affect
//multiple instance behaviour. That is the new instance will cause the
//sound to halt any other intance playing the sound and play for the new instance
//from the start, in effect, causing the other instance to become mute.

//MOTE. Multiple instancing have been tested with WAV file, MID and mp3 
//file. Thus far ONLY WAV and MP3 files will have multiple playing instances.
//Streamed of not, MIDs files will cause the sound halt (other file types may be affected)
//in the other instance and restart in the new instance

//NOTE. To conteract this limitation on MID and streamed files, you may add the same MID
//file multiple times in the system so each file has it's own sound id and instance
//mid_1 = FMODSoundAdd("music.mid",true)
//mid_2 = FMODSoundAdd("music.mid",true)
//mid_3 = FMODSoundAdd("music.mid",false)
//mid_4 = FMODSoundAdd("music.mid",false)
//mp3_1 = FMODSoundAdd("music.mp3",false,true)
//mp3_1 = FMODSoundAdd("music.mp3",false,true)
//
//FMODSoundPlay3d(mid_1,1000,1000,0);
//FMODSoundPlay3d(mid_2,2000,2000,0);
//FMODSoundPlay(mid_3);
//sleep(3000)
//FMODSoundPlay(mid_4);
//FMODSoundPlay(mp3_1);
//sleep(3000)
//FMODSoundPlay(mp3_1);

//You may do this if 2 sounds are close enough to be heard at the same time (in 3d)
//  or you dont want to sound to restart when the player hits the sweet spot, so
//  the sound will have progressed forward while you were away
//  or if the 2 sounds need to play in 2D mode concurenttly
//  AGAIN, this is only for MIDs and streamed files
//  WAV files behave normally and does not require this work arround

//Password encrypted mp3 sounds should not be streamed or you may get odd noises
//If you enabled webmusic, you will not be able to play encripted sounds
//To play a webfile, enter the full url for the file name and set the streamed option
//FMODSoundAdd("http://www.thesite.com/thefileormusicprovider",false,true);
//See also 
//FMODSoundFree()
//FMODSoundPlay()
//FMODSoundLoop()
//FMODSoundPlay3d()
//FMODSoundLoop3d()
//FMODSetPassword()
//FMODinit()

return external_call(global.dll_FMODSoundAdd,argument0, argument1, argument2);
