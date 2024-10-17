function Attacks()
{
	var swordSound = int64(random_range(1,4))

	if swordSound = 1{swordSound = Sword1}
	if swordSound = 2{swordSound = Sword3}
	if swordSound = 3{swordSound = Sword4}
	
	audio_play_sound(swordSound, 20, false, 1, 0);
}