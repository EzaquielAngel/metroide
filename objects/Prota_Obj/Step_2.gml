// colisao horizontal
// cheganfo colisao
var _col = instance_place(x + velh, y, chao_Obj);
// se colidir gruda em quem ta colidindo
if (_col)
{
   //checando a direita
   if (velh > 0)
   {
	 // grudando na esquerda
	 x = _col.bbox_left + (x - bbox_right);
   }
   // checando a esquerda
   if(velh<0)
   {
	   x = _col.bbox_right + (x - bbox_left); 
   }
   // uma vez que colidir nao importa o lado eu paro
   velh = 0;
}	

x += velh;

var  _col    = instance_place(x, y +velv, chao_Obj);
if(_col)
{
	
 if (velv > 0)
 {
	 // para baixo
	 y = _col.bbox_top + (y - bbox_bottom);
 }  
	 
 if (velv < 0)
 {
    //indo para cima	 
	y = _col.bbox_bottom + (y- bbox_top);
 } 
   
   velv = 0;
}


y += velv