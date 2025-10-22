// Inherit the parent event
event_inherited();

// CREATE EVENT
grav = 0.5;
vsp = 0;
hsp = 1.2; // velocidade de patrulha
dir = choose(-1, 1); // direção inicial

max_vida = 14;
vida_atual = 14;

ataque = 4;
timer_estado = 0;

dist = 30;        // distância para visão
arma_offset = 44; // distância da parede pra não encostar a arma

estado = "parado"; 

