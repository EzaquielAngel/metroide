var _chao = place_meeting(x, y + 1, chao_Obj);

if (!_chao) {
    vsp += grav*global.vel_multi;
} else {
    vsp = 0;
}

//if (mouse_check_button_pressed(mb_right))
//{
//	estado = "attack";
//}

// checando se o player esta na linha de visao
// --- Atualiza a direção olhando para o player ---

switch (estado)
{
	
	
case "parado":
{
	timer_estado++;
	if (sprite_index != spr_inimigo_corrompido_idle)
	{
		image_index = 0;
	}
	
 sprite_index = spr_inimigo_corrompido_idle;
 
 // indo para o stado de patrulha
 if (irandom(timer_estado) > 300)
 {
	estado = choose("walk", "parado", "walk");
	timer_estado = 0;
 }
   var facing = (image_xscale >= 0) ? 1 : -1;


var player =  collision_line(x, y - sprite_height/2, x + (dist * facing), y - sprite_height/2, Prota_Obj, 0, 1);

if (player) 
{
	estado = "attack";
}
 
break;	
}

case "walk":
{
	timer_estado++;
	if (sprite_index != spr_inimigo_corrompido_walk)
	{
		image_index = 0;
	}
	
	   sprite_index = spr_inimigo_corrompido_walk;
	    var _vel = 1;
		x += dir * _vel*global.vel_multi;
		if (dir == 1) 
{
    image_xscale = 1; 
}
else if (dir == -1)
{
    image_xscale = -1; 
}
		
		image_xscale = dir;
if place_meeting(x + dir, y, chao_Obj) || !place_meeting(x + dir, y + 1, chao_Obj) {
            dir = -dir;
        }
		
		
		
// condiçao de saida de estado
if (irandom(timer_estado) > 300)
{
	 estado = choose("parado", "parado", "walk");
	 timer_estado = 0;
	
}
var facing = (image_xscale >= 0) ? 1 : -1;


var player =  collision_line(x, y - sprite_height/2, x + (dist * facing), y - sprite_height/2, Prota_Obj, 0, 1);

if (player) 
{
	estado = "attack";
}


break;
	
}

case "attack":
{
	velh = 0;
 if (sprite_index != spr_inimigo_corrompido_ataque1)
 {
	image_index = 0;
	posso = true;
	dano = noone;
	
 }
 sprite_index = spr_inimigo_corrompido_ataque1;


// saindo do estado

if (image_index > image_number-1)
{
	estado = "parado"
	
}
// criando o dano
if (image_index >= 1 && dano == noone && image_index < 5 && posso)
{
	 var offset_x;

    // checa direção do inimigo
    if (image_xscale == 1) {
        // virado para a direita
         offset_x = (bbox_right - x);
    } else {
        // virado para a esquerda
        offset_x = (bbox_left - x);
    }
	
	
	dano = instance_create_layer(x + offset_x, y - sprite_height/4, layer, obj_dano);
	dano.dano = ataque;
	dano.pai = id;
	posso = false;
}
// destruindo o dano
if(dano != noone && image_index >= 5)
{
 instance_destroy(dano);
 dano = noone;
}


	break;
}



case "hit":
{
	if (sprite_index != spr_inimigo_corrompido_hit)
	{
		// inciando o que for prciso para sse estado
		image_index = 0;	
		vida_atual --;
		
	}
	
	sprite_index = spr_inimigo_corrompido_hit; 
	
	
	//condiçao troca de estado
	
	if(image_index > image_number-1)
	{
		// checandi se ainda tenho vida
		if (vida_atual > 0)
		{
		estado = "parado";
		}
		else if (vida_atual <= 0)
		{
		 estado = "dead";	
		}
	}
	
	
	break;
}


case "dead":
{
	if (sprite_index != spr_inimigo_corrompido_morto)
	{
		// inciando o que for prciso para sse estado
		image_index = 0;
	}
		sprite_index = spr_inimigo_corrompido_morto;
		
		// morrendo de verdade
	if (image_index > image_number-0.3)
	{
		image_speed = 0;
		image_alpha -= .01;
		
		if (instance_exists(obj_xp_sistema)) {
    ganhar_xp(0.5); // o valor pode mudar conforme o inimigo
}

		
		if (image_alpha <= 0) instance_destroy();
	}
}


}
