//checando se o objeto transiçao existe
if (instance_exists(obj_mundadodefase))   exit;

// controlando a minha invncibilidad
if (invencivel && tempo_invencivel > 0 )
{
	tempo_invencivel --;
	image_alpha = max(sin(get_timer()/100000), 0.2);
}
else
{
	invencivel = false;
	image_alpha = 1;
}

// Se está no meio da animação de puxar a espada
if (pegando_espada) {
	
	if (estado == "hit") {
        pegando_espada = false;
        tempo_pegar_espada = 0;
        // não dá exit aqui, deixa rodar normalmente
    }
    else {
    // Parar qualquer movimento
    velh = 0;
    
    sprite_index = spr_jogador_puxando;
    image_speed = 1; // velocidade da animação (ajuste conforme necessário)

    // Contador de frames 
    tempo_pegar_espada  --;

    // Quando termina a animação
    if (tempo_pegar_espada <= 0) {
        pegando_espada = false;
        em_modo_combate = !em_modo_combate; // alterna o modo
    }

    // Não executa mais nada enquanto animação está rolando
    exit;
}

}
// Iniciar transição para modo combate (ou sair dele)
if (keyboard_check_pressed(inputs.toggle_combat)) {
    if (!pegando_espada) {
        pegando_espada = true;
        tempo_pegar_espada = 100; // número de frames da animação
        sprite_index = spr_jogador_puxando;
        image_index = 0;
        image_speed = 0;
        velh = 0;
        velv = 0;

        exit; // para não executar mais nada no frame atual
    }
}

if (estado != "hit" && estado != "dead")
{
// Movimento
var _chao = place_meeting(x, y + 1, chao_Obj)


 var _left, _right, _jump, _attack, _dash;
 _left = keyboard_check(inputs.left);
 _right = keyboard_check(inputs.right);
 _jump  = keyboard_check_pressed(inputs.jump);
 _attack = keyboard_check_pressed(inputs.atack);
 _dash = keyboard_check_pressed(ord("C"))
 
 velh = (_right - _left) * vel*global.vel_multi;
 
// colisão pulo
var _jumpstate = place_meeting(x, y, obj_jump_state)

 // pulando
 
 if (_chao or _jumpstate)
 {
	 if (_jump && jump_delay == 0)
	 {
		 jump_delay = 1;
	 }
	 
	 if (jump_delay > 0) {
    jump_delay--;
	
	 if (jump_delay == 0)
   {
	 velv = -vel_jump*global.vel_multi;
	 estado = "pulando";
        image_index = 0;
   }	 
}
   // se estou no chao e me movendo
   if (velh != 0)
   {
	   //mudo a sprite
	  sprite_index = em_modo_combate ? spr_batalha_run_espada : spr_normal_run;  
	  // e faço olhar para onde estou indo
	  image_xscale = sign(velh);
   }   
   else
   {
	  sprite_index = em_modo_combate ? spr_batalha_idle_espada : spr_normal_idle;
	  
   }
   
 }	 
 else // nao estou no chao
 {
	 if (velv < 0)
	 {
	 // mudando sprite
	 sprite_index = em_modo_combate ? spr_combate_jump_espada : spr_normal_jump;
	 }
	 else
	 {
		  sprite_index = em_modo_combate ? spr_combate_fall_espada : spr_normal_fall;
	 }
	 
	 //aplicando gravidade
	 velv += grav;
	 if(velh != 0)
	 {
		image_xscale = sign(velh); 
	 }
 }
}
 
 //iniciando maquina de estado
 switch(estado)
 {
	 #region parado
	 case "parado":
	 {
		 //comportamento do estado
		 sprite_index = em_modo_combate ? spr_batalha_idle_espada : spr_normal_idle;
		 
		 //condicao da troca estado
		 // movendo
		  
		  if (velh != 0)
		  {
			estado = "movendo";
			image_index = 0;
		  }
		  else if (_jump && jump_delay == 0 || velv != 0)
		  {
			estado = "pulando";
			image_index = 0;
		  }
		 else if (_attack && em_modo_combate)
		 {
			 estado = "ataque";
			 velh = 0;
			 image_index = 0;
		 }
		 else if(_dash)
		 {
			estado = "dash";
			image_index = 0
		 }
		 
		 break;
	 }
	 #endregion
	 #region movendo
	 case "movendo":
	 {
		 // comportamento do estado de movimento
		 sprite_index = em_modo_combate ? spr_batalha_run_espada : spr_normal_run;
		 
		 //condiçao troca de estado
		 //parado
		 if(abs(velh) < .1)
		 {
		    estado = "parado";
			velh = 0;
		 }
		 else if(_attack && em_modo_combate)
		 {
			estado = "ataque"; 
			velh = 0;
		image_index = 0;
		 }
		 
		 else if (_jump && jump_delay == 0 && em_modo_combate || velv != 0)
		  {
			estado = "pulando";
			image_index = 0;
		  }
		 else if (_dash)
		 {
		 	estado = "dash";
			image_index = 0;
		 }
		 
		 break;
	 }
	 #endregion
	 
	 #region pulando
	 case "pulando":
	 {
		 // estou caindo
		  if (velv > 0)
		  {
			  sprite_index = em_modo_combate ? spr_combate_fall_espada : spr_normal_fall; 
		  }
		  else
		  {
			sprite_index = em_modo_combate ? spr_combate_jump_espada : spr_normal_jump; 
		  }
		  
		  // condiçao troca de estado
		  if (_chao)
		  {
			estado = "parado"  
		  }
		  
		 break;
		 
	 }
	 #endregion
	 
	 #region ataque
	 case "ataque":
{
 
 velh = 0;
 
 if(combo == 0 )
 {
            sprite_index = spr_ataque_1;
 }
 else if (combo == 1)
 {
   sprite_index = spr_ataque2;
 }
 
 else if (combo == 2)
 {
   sprite_index = spr_ataque3; 
 }
 // criando o objeto de dano
 if (image_index >= 2 && dano == noone && posso)
 {
   dano = instance_create_layer(x + sprite_width/2, y - sprite_height/2, layer, obj_dano);
   dano.dano = ataque*ataque_multi;
   dano.pai = id;
   posso    = false;
   
 }
 
 if (_attack && combo <= 3 && image_index >= image_number -3)
 {
	 combo ++; 
	 image_index = 0; 
	 posso = true;
	 ataque_multi += .5;
	  if(dano)
	 {
	  instance_destroy(dano, false);
	  dano = noone;
	 }
 }
 
 
 if (image_index > image_number -2.5)
 {
	 estado = "parado";
	 velh = 0;
	 combo = 0;
	 posso = true;
	 ataque_multi = 1;
	 if(dano)
	 {
	  instance_destroy(dano, false);
	  dano = noone;
	 }
 }
 if (_dash)
		 {
		 	estado = "dash";
			image_index = 0;
			combo = 0;
			if(dano)
			{
				instance_destroy(dano, false);
				dano = noone;
			}
		 }
break;	
}
#endregion

#region dash
case "dash":
{
	if (sprite_index != spr_jogador_dash) 
	{
	sprite_index = spr_jogador_dash;
	}
	
	// velocidade
	velh = image_xscale * dash_vel;
	
	// saindo do estado
	
	if (image_index >= image_number -2)
	{
		estado = "parado";
		
	}
	
	break;
}
#endregion

case "hit":
{
if (sprite_index != spr_jogador_hit)
{
	sprite_index = spr_jogador_hit;
	
	
	//tremndo a tela
	var shake = instance_create_layer(0,0, layer, Obj_screanshake);
	shake.shake = 4;
	
	//deixando invencivel
	invencivel = true;
	tempo_invencivel = invencivel_timer;
	
}
//ficando parado ao levar dano
velh = 0;

//checando se eu posso morrer
if(vida_atual > 0)
{
//saindo do estado 
   if (image_index >= image_number -1)
   {
	estado = "parado";
   }
}
   else 
   {
	if (image_index >= image_number - 1)
	{
		estado = "dead";
	}
}
	
	break;
}

case "dead":
{
	//checando se o controlador esxite
	if(instance_exists(Obj_game_controller))
	{
		with(Obj_game_controller)
		{
			game_over = true;
		}
	}
	
	if (sprite_index != spr_jogador_dead)
	{
		image_index = 1;
		sprite_index = spr_jogador_dead;
	}
	// ficando parado no final da animaçao
	if (image_index >= image_number -1)
	{
		image_index = image_number -1;
	}
	
	break;
}

// estado padrão
default:
{
	estado = "parado";
}

 }
show_debug_message(tempo_invencivel);

 
 if(keyboard_check(vk_enter)) game_restart();
 