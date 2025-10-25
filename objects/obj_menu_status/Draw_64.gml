// Draw GUI (versão compatível)
var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

// Fundo escurecido
draw_set_alpha(0.6);
draw_set_color(c_black);
draw_rectangle(0, 0, gui_w, gui_h, false);
draw_set_alpha(1);

// Painel central (fundo do menu)
var painel_w = 340;
var painel_h = 260;
var painel_x = gui_w/2 - painel_w/2;
var painel_y = gui_h/2 - painel_h/2;

// Sombra do painel
draw_set_color(make_color_rgb(10,10,10));
draw_rectangle(painel_x + 6, painel_y + 6, painel_x + painel_w + 6, painel_y + painel_h + 6, false);

// Fundo do painel
draw_set_color(make_color_rgb(18,18,26));
draw_rectangle(painel_x, painel_y, painel_x + painel_w, painel_y + painel_h, false);

// Borda leve
draw_set_color(make_color_rgb(80,80,100));
draw_rectangle(painel_x, painel_y, painel_x + painel_w, painel_y + painel_h, true);

// Título centralizado
if (font_menu != -1) draw_set_font(font_menu);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_text(gui_w/2, painel_y + 12, "Distribuir Pontos");

// Pontos disponíveis
draw_set_font(-1);
draw_set_valign(fa_top);
draw_text(gui_w/2, painel_y + 36, "Pontos: " + string(player.pontos_status));

// Lista de botões (centralizados)
var nomes = [
    "Ataque: " + string(player.forca),
    "Resistência: " + string(player.resistencia),
    "Velocidade: " + string(player.velocidade)
];

var botao_largura = 220;
var botao_altura = 44;
var espaco = 12;
var start_y = painel_y + 72;

// Para cada botão: sombra, fundo (hover), texto
for (var i = 0; i < array_length(nomes); i++) {
    var bx = gui_w/2 - botao_largura/2;
    var by = start_y + i * (botao_altura + espaco);

    // Sombra do botão
    draw_set_color(make_color_rgb(8,8,8));
    draw_rectangle(bx + 2, by + 2, bx + botao_largura + 2, by + botao_altura + 2, false);

    // Cor do botão (hover)
    if (botao_hover == i) {
        draw_set_color(make_color_rgb(110,170,255)); // hover
    } else {
        draw_set_color(make_color_rgb(90,90,96)); // normal
    }
    draw_rectangle(bx, by, bx + botao_largura, by + botao_altura, false);

    // Borda leve do botão
    draw_set_color(make_color_rgb(40,40,48));
    draw_rectangle(bx, by, bx + botao_largura, by + botao_altura, true);

    // Texto do botão (alinhado à esquerda dentro do botão)
    draw_set_halign(fa_left);
    draw_set_valign(fa_middle);
    draw_set_color(c_white);
    draw_text(bx + 12, by + botao_altura/2, nomes[i] + "   [+]");
}

// Restaura alinhamentos padrões
draw_set_halign(fa_left);
draw_set_valign(fa_top);
