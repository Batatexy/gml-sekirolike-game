function Moans()
{
	var moan = int64(random_range(1,8))

	if moan = 1{moan = Moan1}
	if moan = 2{moan = Moan2}
	if moan = 3{moan = Moan3}
	if moan = 4{moan = Moan4}
	if moan = 5{moan = Moan5}
	if moan = 6{moan = Moan6}
	if moan = 7{moan = Moan7}

	audio_play_sound(moan, 20, false, 1, 0);
}