// criando a tela de game over

if(game_over)
{
	//pefando algumas informacoes
	var x1 = camera_get_view_x(view_camera[0]);
	var w = camera_get_view_width(view_camera[0]);
	var x2 = x1 + w;
	var meio_w = x1 + w/2;
	
	
	var y1 = camera_get_view_y(view_camera[0]);
	var h = camera_get_view_height(view_camera[0]);
	var y2 = y1 + h;
	var meio_h = y1 + h/2;
	
	var qtd = h * .15;
	
	valor = lerp(valor, 1, .05);

	
	
	//desenhando o retangulo de cima
	draw_set_color(c_black);
	//escurecendo a tela
	draw_set_alpha(valor - .3);
	draw_rectangle(x1, y1, x2, y2, false);
	
	draw_set_alpha(1);
	draw_rectangle(x1, y1, x2, y1 + qtd * valor, false);
	
	//desenhadno o rtangulo d baixo
	draw_rectangle(x1, y2, x2, y2 - qtd * valor, false);
	
	
	draw_set_alpha(1);
	draw_set_color(-1);
	
	//dando um daley para o game ovr
	if (valor >= .85)
	{
		suave = lerp(suave, 1, .01);
		
	//escrevendo game over
	draw_set_alpha(suave);
	draw_set_font(fnt_gameover);
	draw_set_valign(1);
	draw_set_halign(1);
	
	//sombra
	draw_set_color(c_red);
	draw_text(meio_w + 1,  meio_h + 1, "Se tornou pedra");
    // texto
	draw_set_color(c_white);
    draw_text(meio_w,  meio_h, "Se tornou pedra");
	
	draw_set_font(-1);
	
	draw_text(meio_w, meio_h + 40, "pressione enter para reniciar");
	
	draw_set_valign(-1);
	draw_set_halign(-1);
	draw_set_alpha(-1)
	}
	
	
}