// Mensagem flutuante
if (player_proximo && !mostrar_tutorial) {
	 draw_set_font(fnt_small);
	
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_white);
    draw_text(x, y - 32, mensagem_interacao);
	
	draw_set_font(-1);
}

if (mostrar_tutorial) {
    var cam = view_camera[0];
    var vx = camera_get_view_x(cam);
    var vy = camera_get_view_y(cam);
    var vw = camera_get_view_width(cam);
    var vh = camera_get_view_height(cam);

    var box_w = 300;
    var box_h = 120;
    var box_x = vx + (vw - box_w) / 2; // centro horizontal da view
    var box_y = vy + vh - box_h - 30;  // parte de baixo da tela (ajuste 30 se quiser mais alto)

    // Fundo
    draw_set_color(make_color_rgb(0, 0, 0));
    draw_rectangle(box_x, box_y, box_x + box_w, box_y + box_h, false);

    // Borda
    draw_set_color(c_white);
    draw_rectangle(box_x, box_y, box_x + box_w, box_y + box_h, true);

    // Texto
	draw_set_font(fnt_dialgo);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_color(c_white);
    draw_text(box_x + 10, box_y + 5, texto_tutorial);
	draw_set_font(-1);
}
