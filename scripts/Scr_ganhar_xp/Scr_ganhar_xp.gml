function Scr_ganhar_xp(){

}
/// @function ganhar_xp(valor)
/// @param valor -> quanto XP o jogador vai ganhar
function ganhar_xp(valor) {
    with (obj_xp_sistema) {
        xp_atual += valor;
        xp_total += valor;

        // Subiu de nível?
        if (xp_atual >= xp_prox) {
            xp_atual -= xp_prox;
            nivel += 1;

            // aumenta o XP necessário a cada nível
            xp_prox = round(xp_prox * 1.25);

            // (opcional) toque um som de level up
            // audio_play_sound(snd_levelup, 1, false);

            // ✅ Adiciona pontos de status ao player
            if (instance_exists(Prota_Obj)) {
                with (Prota_Obj) {
                    pontos_status += 1;
                }
            }
        }
    }
}
