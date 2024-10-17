function MegaParrys()
{
	var megaParry = int64(random_range(1,4))

	if megaParry = 1{megaParry = MegaParry1}
	if megaParry = 2{megaParry = MegaParry2}
	if megaParry = 3{megaParry = MegaParry3}

	audio_play_sound(megaParry, 20, false, 1, 0);
}