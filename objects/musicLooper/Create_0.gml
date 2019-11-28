/// @description This will loop music depending on your scene
// @author Marcos Lacouture

musicVolume = 0; //By default, musicVolume is 100. This can be changed in settings.

audio_sound_gain(0, musicVolume, 0);
audio_play_sound(0, 0, 1); //Play MainTheme on game startup, have it loop
persistent = true;