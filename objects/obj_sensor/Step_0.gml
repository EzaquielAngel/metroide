//checar se estou colidindo com o player

var player = place_meeting(x, y, Prota_Obj);

// i 
var i = keyboard_check_released(ord("I"));

if (player && i)
{
	//codigo da transiçao
	var tran = instance_create_layer(0, 0, layer, obj_mundadodefase);
	tran.destino = destino;
	tran.destino_x = destino_x;
	tran.destino_y = destino_y;
}

