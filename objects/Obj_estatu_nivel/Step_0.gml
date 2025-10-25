// Verifica se o player está próximo
player_proximo = distance_to_object(Prota_Obj) < 50;

// Abre o menu ao apertar I
if (player_proximo && keyboard_check_pressed(ord("I"))) {
    instance_create_layer(x, y, "GUI", obj_menu_status);
}
