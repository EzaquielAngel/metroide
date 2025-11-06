// Fundo preto com fade
draw_set_alpha(alpha_credito);
draw_set_color(merge_color(c_black, cor_base, alpha_credito * 0.5));
draw_rectangle(0, 0, room_width, room_height, false);

// Texto principal
draw_set_font(fnt_gameover); // troque pela sua fonte
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Efeito de brilho pulsante na cor
var brilho = 0.5 + 0.5 * sin(current_time / 300);
var cor_texto = merge_color(c_white, c_aqua, brilho);

draw_set_color(cor_texto);
draw_set_alpha(alpha_credito);

// Desenha o texto com escala animada
draw_text_transformed(room_width / 2, room_height / 2, "Feito por @Ezaquiel_angel", escala, escala, 0);

// Resetar alpha
draw_set_alpha(1);
