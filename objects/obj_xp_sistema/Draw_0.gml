// Posição da câmera (acompanha a view)
var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);

// --- CONFIGURAÇÕES VISUAIS ---
var barra_largura = 120; // largura total
var barra_altura  = 8;   // altura
var margem_x = 16;       // distância da borda esquerda
var margem_y = 16;       // distância do topo

// Posição final
var pos_x = cam_x + margem_x;
var pos_y = cam_y + margem_y;

// --- Cores ---
var cor_fundo   = make_color_rgb(40, 40, 40);   // fundo escuro
var cor_borda   = make_color_rgb(10, 10, 10);   // borda quase preta
var cor_xp      = make_color_rgb(0, 200, 255);  // azul da barra
var cor_sombra  = make_color_rgb(0, 0, 0);      // sombra

// --- SOMBRA ---
draw_set_alpha(0.4);
draw_set_color(cor_sombra);
draw_rectangle(pos_x + 2, pos_y + 2, pos_x + barra_largura + 2, pos_y + barra_altura + 2, false);
draw_set_alpha(1);

// --- FUNDO DA BARRA ---
draw_set_color(cor_fundo);
draw_rectangle(pos_x, pos_y, pos_x + barra_largura, pos_y + barra_altura, false);

// --- PREENCHIMENTO DE XP ---
var largura_atual = (xp_atual / xp_prox) * barra_largura;
draw_set_color(cor_xp);
draw_rectangle(pos_x, pos_y, pos_x + largura_atual, pos_y + barra_altura, false);

// --- BORDA ---
draw_set_color(cor_borda);
draw_rectangle(pos_x - 1, pos_y - 1, pos_x + barra_largura + 1, pos_y + barra_altura + 1, true);

// --- TEXTO ---
draw_set_color(c_white);
draw_text(pos_x, pos_y - 18, "level: " + string(nivel));
draw_text(pos_x, pos_y + 12, "XP: " + string(xp_atual) + " / " + string(xp_prox));
