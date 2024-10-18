function FadeIn(value)
{
	if global.alpha <= 1
	{
		 global.alpha += value
	}
	else
	{
		global.alpha = 1
	}
}

function FadeOut(value)
{
	if global.alpha >= 0
	{
		 global.alpha -= value
	}
	else
	{
		global.alpha = 0
	}
}
