// sistema de colisão

var _velh = sign (velh);
var _velv = sign (velv);

repeat (abs(velv))
{
if (place_meeting(x + _velh, y, chao_Obj))
   {
	   velh = 0;
	   break;
   }   
   x += _velh;
}

//vertical
repeat (abs(velv))
{
	if (place_meeting(x, y + _velv, chao_Obj))
	{
		_velv = 0;
		break;
	}
	y += _velv;
}