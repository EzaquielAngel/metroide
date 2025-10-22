// Inherit the parent event
event_inherited();

var facing = (image_xscale >= 0) ? 1 : -1;

//desemhando a linha de visao
draw_line(x, y - sprite_height/2, x + (dist * facing), y - sprite_height/2);



