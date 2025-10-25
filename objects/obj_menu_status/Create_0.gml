player = Prota_Obj;

// Configuração de botões
botao_largura = 220;
botao_altura = 45;
espaco = 12;
botao_y_base = display_get_gui_height() / 2 - 30;

botao_hover = -1;

// Cores
cor_normal = make_color_rgb(70, 70, 70);
cor_hover = make_color_rgb(120, 180, 255);
cor_texto = c_white;

// Fonte
if (font_exists(fnt_dialgo)) font_menu = fnt_dialgo;
else font_menu = -1;


