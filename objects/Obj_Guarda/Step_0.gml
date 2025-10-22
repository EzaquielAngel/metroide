/// Step Event

var _chao = place_meeting(x, y + 1, chao_Obj);

// Gravidade
if (!_chao) {
    vsp += grav * global.vel_multi;
} else {
    vsp = 0;
}

// Distância até o player
var _dist_player = point_distance(x, y, Prota_Obj.x, Prota_Obj.y);

// Limites de visão e distância mínima pra parar
var visao = 250;     // distância máxima pra começar a perseguir
var dist_min = 100;   // distância mínima — para de andar quando chega perto

// Troca de estado
if (_dist_player < visao && _dist_player > dist_min && estado != "perseguir") {
    estado = "perseguir";
}
else if (_dist_player <= dist_min && estado != "parado_perto") {
    estado = "parado_perto"; // perto o bastante, espera pra atacar
}
else if (_dist_player >= visao && estado != "parado") {
    estado = "parado";
}

// --- Comportamento de cada estado ---
switch (estado)
{
    case "parado":
        {
            hsp = 0;
            sprite_index = Spr_guarda_idle;
        }
        break;

    case "perseguir":
        {
            if (Prota_Obj.x < x) dir = -1;
            else dir = 1;

            hsp = dir * 1.5;
            sprite_index = Spr_guarda_walk;
        }
        break;

    case "parado_perto":
        {
            hsp = 0;
            sprite_index = Spr_guarda_idle;

            // aqui depois você pode colocar o ataque
            // ex: if (timer_estado > 60) { estado = "atacar"; }
        }
        break;
}

// Movimento horizontal
if (!place_meeting(x + hsp, y, chao_Obj)) {
    x += hsp;
}

// Aplicar movimento vertical
y += vsp;

// Espelhar sprite
image_xscale = -dir;
