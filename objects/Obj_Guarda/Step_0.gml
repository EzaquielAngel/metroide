
// --- Detectar chão ---
var _chao = place_meeting(x, y + 1, chao_Obj);
if (!_chao) vsp += grav * global.vel_multi;
else vsp = 0;

// --- Detectar colisão com objeto de dano ---
if (place_meeting(x, y, obj_dano) && estado != "hit") {
    vida_atual -= 1;
    estado = "hit";
    image_index = 0;
}

// --- Se a vida acabar ---
if (vida_atual <= 0) {
    instance_destroy();
}

// --- Distância até o player ---
var _dist_player = point_distance(x, y, Prota_Obj.x, Prota_Obj.y);
var visao = 250;
var dist_min = 100;

// --- Sistema de estados ---
switch (estado)
{
    case "parado":
        {
            hsp = 0;
            sprite_index = Spr_guarda_idle;

            if (_dist_player < visao && _dist_player > dist_min) estado = "perseguir";
        }
        break;

    case "perseguir":
        {
            if (_dist_player < visao && _dist_player > dist_min) {
                if (Prota_Obj.x < x) dir = -1; else dir = 1;
                hsp = dir * 1.5;
                sprite_index = Spr_guarda_walk;
            }
            else if (_dist_player <= dist_min) {
                estado = "parado_perto";
            }
            else if (_dist_player >= visao) {
                estado = "parado";
            }
        }
        break;

    case "parado_perto":
        {
            hsp = 0;
            sprite_index = Spr_guarda_idle;

            if (_dist_player > dist_min) estado = "perseguir";
        }
        break;

    case "hit":
        {
            hsp = 0;
            sprite_index = Spr_guarda_hurt;

            // quando a animação de hit termina, volta ao comportamento normal
            if (image_index >= image_number - 1) {
                if (_dist_player < visao && _dist_player > dist_min) estado = "perseguir";
                else if (_dist_player <= dist_min) estado = "parado_perto";
                else estado = "parado";
            }
        }
        break;
}

// --- Movimento ---
if (!place_meeting(x + hsp, y, chao_Obj)) {
    x += hsp;
}
y += vsp;

// --- Espelhar sprite ---
image_xscale = -dir;

