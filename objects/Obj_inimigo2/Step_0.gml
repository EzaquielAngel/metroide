// STEP EVENT

// Gravidade
if (!place_meeting(x, y + 1, chao_Obj)) {
    vsp += grav;
} else {
    vsp = 0;
}
y += vsp;

// ==============================
// Estados
// ==============================
switch (estado) {
    
    // ------------------ PARADO ------------------
    case "parado":
	{
        timer_estado++;
        
        if (sprite_index != spr_inimigo2_idel) {
            sprite_index = spr_inimigo2_idel;
            image_index = 0;
        }
        
        // Troca de estado aleatória
        if (irandom(timer_estado) > 180) {
            estado = choose("walk", "walk", "parado");
            timer_estado = 0;
        }
        
    break;
	
	}
    
    // ------------------ ANDANDO ------------------
    case "walk":
	{
        timer_estado++;
        
        if (sprite_index != Spr_inimigo2_walk) {
            sprite_index = Spr_inimigo2_walk;
            image_index = 0;
        }
        
        // Movimento
        x += dir * hsp;
        
        // Virar se chegar na borda
        if (!place_meeting(x + dir * 44, y + 1, chao_Obj)) {
            dir *= -1;
        }
        
        // Virar se tiver parede muito perto (considerando a arma)
    if (collision_line(x, y - sprite_height/2, x + dir * arma_offset, y - sprite_height/2, chao_Obj, false, true)) {
    dir *= -1;
}
// Espelhar sprite conforme direção
if (dir == 1) {
    image_xscale = 1; // olhando para a direita
} else {
    image_xscale = -1; // olhando para a esquerda
}

        
        // Troca de estado aleatória
        if (irandom(timer_estado) > 240) {
            estado = choose("parado", "walk", "parado");
            timer_estado = 0;
        }
		

    break;
}

	case "hit":
{
	if (sprite_index != Spr_inimigo2_hurt)
	{
		// inciando o que for prciso para sse estado
		image_index = 0;	
		vida_atual --;
		
	}
	
	sprite_index = Spr_inimigo2_hurt; 
	
	
	//condiçao troca de estado
	
	if(image_index > image_number-1)
	{
		// checando se ainda tenho vida
		if (vida_atual > 0)
		{
		estado = "parado";
		}
		
	}
	
}

		break;
}