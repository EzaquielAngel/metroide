// Inherit the parent event
event_inherited();

max_vida = 14;
vida_atual = 14;

velh     = 0;
velv     = 0;

ataque = 4;
timer_estado = 0;

grav = 0.5;        // força da gravidade
vsp = 0;           // velocidade vertical
hsp = 1.5; // começa andando para a direita
dir = choose(-1,1); // direção inicial do inimigo

vis = 1;
dist = 30;

dano = noone;
posso = true;