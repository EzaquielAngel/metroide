if (keyboard_check_pressed(vk_escape)) {
    instance_destroy();
}

// Posição do mouse na GUI
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

// Detectar hover
botao_hover = -1;
for (var i = 0; i < 3; i++) {
    var bx = display_get_gui_width() / 2 - botao_largura / 2;
    var by = botao_y_base + i * (botao_altura + espaco);
    if (point_in_rectangle(mx, my, bx, by, bx + botao_largura, by + botao_altura)) {
        botao_hover = i;
    }
}

// Clique
if (mouse_check_button_pressed(mb_left) && botao_hover != -1) {
    if (player.pontos_status > 0) {
        switch (botao_hover) {
            case 0: player.forca += 1; break;
            case 1: player.resistencia += 1; break;
            case 2: player.velocidade += 1; break;
        }
        player.pontos_status -= 1;
    } 
    }

