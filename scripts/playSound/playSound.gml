toPlay = argument0; //Only argument passed into script is the index of the sound to play
audio_sound_gain(toPlay, inst_SFXPLAYER.SFXVolume/100, 0);
audio_play_sound(toPlay, 0, 0);