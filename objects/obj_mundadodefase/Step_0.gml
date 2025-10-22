// ja mudei de room


if (mudei)
{
	alpha -= 0.03;
}
else // ainda nao mudei de room
{
	alpha += .03;
}

// quando o aplha passar de 1 muda de romm
if(alpha >= 1)
{
	room_goto(destino);
	
	// controlando a posicao do player
	Prota_Obj.x = destino_x;
	Prota_Obj.y = destino_y;
}

// me destruindo depois de mudar de rooom
if(mudei && alpha <= 0)
{
	instance_destroy();
}
