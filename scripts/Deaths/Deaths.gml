function Deaths()
{
	var death = int64(random_range(1,4))

	if death = 1{death = Death1}
	if death = 2{death = Death2}
	if death = 3{death = Moan6}


	audio_play_sound(death, 20, false, 1, 0);
}