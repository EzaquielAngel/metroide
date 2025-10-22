var outro;
var outro_lista = ds_list_create();
var quantidade = instance_place_list(x, y, obj_entidade, outro_lista, 0);



// adicionando todo mundo qu toquei na lista
for (var i = 0; i < quantidade; i ++)
{
	// checando o atual
	var atual = outro_lista[|i];
	
	//checando se o atual esta invencivel
if (atual.invencivel)
{
	continue;
}
	
	
	
	// checando se a coliçao nao  com um filho do meu pai
	if(object_get_parent(atual.object_index) != object_get_parent(pai.object_index))
	{
		//isso so vai rodar se u der dano no coisinha
		
		// checar se eu realmnt posso dar dano
		
		// chegar se o atual esta na lista
		var pos = ds_list_find_index(aplicar_dano, atual);
		if (pos == -1)
		{
			// se o atual ainda nao sta na lista d dano
			//adiciona na lista
			ds_list_add(aplicar_dano, atual);
			
		}
		
	}
}
//aplicando dano
var tam =ds_list_size(aplicar_dano);
for (var i = 0; i < tam; i++)
{
	outro = aplicar_dano[|i].id;
	if (outro.vida_atual > 0)
	{
outro.estado = "hit";
outro.image_index = 0;
outro.vida_atual -= dano;

//preciso chegar s stou chcando o inimigo
// chgando s sou filho do meu pai
if(object_get_parent(outro.object_index) == obj_inimigo_pai)
{
	//dando um screanskahe apenas para inimigos
	var shake = instance_create_layer(0,0, layer, Obj_screanshake);
	shake.shake = 2;
	
}

	}
}
// destruindo inhsa listas
ds_list_destroy(aplicar_dano);
ds_list_destroy(outro_lista);


instance_destroy();

/*// se estou tocando em algem
if (outro)
{
// se eu nao estou tocando no meu pai
if (outro.id != pai)
{
	
	//chegando quem  o pai
	var _papi = object_get_parent(outro.object_index);
	if (_papi != object_get_parent(pai.object_index))
	{
	if (outro.vida_atual > 0)
	{
outro.estado = "hit";
outro.image_index = 0;
outro.vida_atual -= dano;
instance_destroy();
	}
	}
}
	
}