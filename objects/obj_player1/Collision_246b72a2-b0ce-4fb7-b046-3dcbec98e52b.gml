/// @description get hurt
if (hurt_timer < 0) {
	health_ -= 10;
	hurt_timer = 30;
	audio_play_sound(snd_oof_0, 10, false);
} else {
	hurt_timer -= 1;
}