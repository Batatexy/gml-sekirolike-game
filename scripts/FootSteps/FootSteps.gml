function FootSteps()
{
	var stepSound = int64(random_range(1,17))
	if stepSound = 1{stepSound = Grass1}
	if stepSound = 2{stepSound = Grass2}
	if stepSound = 3{stepSound = Grass3}
	if stepSound = 4{stepSound = Grass4}
	if stepSound = 5{stepSound = Grass5}
	if stepSound = 6{stepSound = Grass6}
	if stepSound = 7{stepSound = Grass7}
	if stepSound = 8{stepSound = Grass8}
	if stepSound = 9{stepSound = Grass9}
	if stepSound = 10{stepSound = Grass10}
	if stepSound = 11{stepSound = Grass11}
	if stepSound = 12{stepSound = Grass12}
	if stepSound = 13{stepSound = Grass13}
	if stepSound = 14{stepSound = Grass14}
	if stepSound = 15{stepSound = Grass15}
	if stepSound = 16{stepSound = Grass16}
	audio_play_sound(stepSound, 20, false, 1, 0);
}