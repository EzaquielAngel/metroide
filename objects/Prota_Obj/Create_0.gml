randomize ();

// criando a camera
var cam = instance_create_layer(x, y, layer, obj_camera);
cam.alvo = id;

jump_delay = 0;

velh     = 0;
velv     = 0;
vel      = 4;
grav     = 0.3;
vel_jump = 6;
dash_vel = 3;


invencivel = false;
invencivel_timer = room_speed * 2.5;
tempo_invencivel = invencivel_timer;


inputs = {
	left : vk_left,
	right : vk_right,
	jump : ord ("X"),
	toggle_combat : vk_shift,
	atack: ord ("Z")
	
}

event_inherited()

// vida
max_vida = 10;
vida_atual = 10;

// estado
mostra_estado = true;

// Combat mode
em_modo_combate = false; // inicialmente sem espada
pegando_espada = false;  // animação intermediária
tempo_pegar_espada = 0;  // controle do tempo da animação

// Sprites (ajuste os nomes conforme seus assets)
spr_normal_idle        = spr_jogador_idle;
spr_normal_run         = spr_jofador_run;
spr_normal_jump        = spr_jogador_jump;
spr_normal_fall        = spr_jogador_fall;
spr_batalha_idle_espada = spr_jogador_idle_espada;
spr_batalha_run_espada  = spr_jogador_run_espada;
spr_combate_jump_espada = spr_jogador_jump_espada;
spr_combate_fall_espada = spr_jogador_fall_espada;
spr_ataque_1 = spr_jogador_ataque1;
spr_ataque2 = spr_jogador_ataque2;
spr_ataque3 = spr_jogador_ataque3;
spr_dash = spr_jogador_dash;
spr_dash2 = spr_jogador_dash;

//transiçao
spr_jogador_puxando     = spr_jogador_puxando_espada;

// combo
combo = 0;
dano = noone;
ataque = 1;
ataque_multi = 1.25;

posso = true;






