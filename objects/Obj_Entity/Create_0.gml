//Atributos
staminaValueOriginal = 100
staminaValue = staminaValueOriginal
stamina = staminaValue

lifeValueOriginal = 100
lifeValue = lifeValueOriginal
life = lifeValue

//Quantidade de curas
things = 3

defaultMoveSpeed = 1.5
moveSpeed = defaultMoveSpeed

//Mudar as cores do personagem
red = 255
green = 255
blue = 255

//Inputs:
space = false
right = false
left = false
mouse1 = false
mouse2 = false
buttonHeal = false
buttonHook = false
buttonDash = false

//Inimigos:
	//Inimigo mais proximo e a direção desse inimigo
	nearestEnemyDirection = 0
	nearestEnemy = 0

//Movimentação:
	//Direção de Movimento
	moveDirection = 1
	forceMove = 0

	//Movimentação Horizontal
	horizontalSpeed = 0

	//Movimentação Vertical
	verticalSpeed = 0
	terminalVelocity = 4
	gravitySpeed = .275
	jumpSpeed = -3.5

//Ações:
	//Atacar e Defender
	attack = 0
	deflect = 0
	
	//Curar
	heal = 0
	isHealing = 0
	
	//Movimentações extras
	dash = 0
	dashTimerValue = 12
	dashTimer = dashTimerValue
	
	grapplingHook = 0
	nearestGrapplingHook = 0
	nearestGrapplingHookDirection = 0
	
	//Tipo de ataque executado
	attackType = 1

	//Tomar Hits
	tackingHit = 0

	//Tempo de invulnerabilidade
	tackingHitTimerValue = 30
	tackingHitTimer = tackingHitTimerValue
	
	//Tempo tomar a cura
	healTimerValue = 35
	healTimer = healTimerValue
	
	//Tempo pra vida subir aos poucos
	isHealingTimerValue = 15
	isHealingTimer = isHealingTimerValue
	
	//Quantidade de cura por tick
	healValue = 4

	//Efetuar parry ou defesa
	deflectTimerValue = 20
	deflectTimer = deflectTimerValue