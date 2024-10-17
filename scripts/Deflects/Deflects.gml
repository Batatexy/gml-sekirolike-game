function Deflects()
{
	var block = int64(random_range(1,5))

	if block = 1{block = Block1}
	if block = 2{block = Block2}
	if block = 3{block = Block3}
	if block = 4{block = Block4}


	audio_play_sound(block, 20, false, 1, 0);
}
