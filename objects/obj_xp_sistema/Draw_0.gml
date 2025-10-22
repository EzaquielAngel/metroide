// Posição baseada na câmera (acompanha a view)
var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);

// --- CONFIGURAÇÕES VISUAIS ---
var barra_largura = 100; // largura da barra
var barra_altura  = 6;   // altura da barra
var margem_x = 16;       // distância da borda da tela
var margem_y = 16;       // distância do topo

// Posição final
var pos_x = cam_x + margem_x;
var pos_y = cam_y + margem_y;

// --- DESENHAR FUNDO ---
draw_set_color(make_color_rgb(40, 40, 40)); // cinza escuro
draw_rectangle(pos_x, pos_y, pos_x + barra_largura, pos_y + barra_altura, false);

// --- DESENHAR BARRA DE XP ---
var largura_atual = (xp_atual / xp_prox) * barra_largura;
draw_set_color(c_aqua);
draw_rectangle(pos_x, pos_y, pos_x + largura_atual, pos_y + barra_altura, false);

// --- TEXTO ---
draw_set_color(c_white);
draw_set_font(-1); // fonte padrão
draw_text(pos_x, pos_y - 16, "Level " + string(nivel));
draw_text(pos_x, pos_y + 10, "XP: " + string(xp_atual) + " / " + string(xp_prox));
