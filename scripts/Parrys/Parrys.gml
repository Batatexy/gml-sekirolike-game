function Parrys()
{
	var parry = int64(random_range(1,7))

	if parry = 1{parry = Parry1}
	if parry = 2{parry = Parry2}
	if parry = 3{parry = Parry3}
	if parry = 4{parry = Parry4}
	if parry = 5{parry = Parry5}
	if parry = 6{parry = Parry6}


	audio_play_sound(parry, 20, false, 1, 0);
}