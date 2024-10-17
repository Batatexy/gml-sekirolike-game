function Hits()
{
	var hit = int64(random_range(1,4))

	if hit = 1{hit = Hit1}
	if hit = 2{hit = Hit2}
	if hit = 3{hit = Hit3}

	audio_play_sound(hit, 20, false, 1, 0);
}