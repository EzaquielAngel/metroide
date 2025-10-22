/// Draw GUI Event
if (player_near) {
	 draw_set_font(fnt_small);
	
	
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_white);
    draw_text(x, y - 32, interaction_message);
	
	draw_set_font(-1);
}