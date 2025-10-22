player_proximo = false;

var inst = instance_nearest(x, y, Prota_Obj);
if (inst != noone) {
    var dist = point_distance(x, y, inst.x, inst.y);
    
    if (dist < raio_interacao) {
        player_proximo = true;

        // Apertar E → abre ou fecha o tutorial
        if (keyboard_check_pressed(ord("I"))) {
            mostrar_tutorial = !mostrar_tutorial;
        }
    }
}

// Se o jogador sair de perto, fecha automaticamente
if (mostrar_tutorial && inst != noone && point_distance(x, y, inst.x, inst.y) > raio_interacao) {
    mostrar_tutorial = false;
}
