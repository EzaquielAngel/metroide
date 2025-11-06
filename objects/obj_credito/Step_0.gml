// ===== Controle da animação de introdução =====
switch (estado_credito) {

    // ---------- FADE IN ----------
    case "fade_in":
        alpha_credito += 0.03;
        if (alpha_credito >= 1) {
            alpha_credito = 1;
            estado_credito = "mostrar";
        }
        break;

    // ---------- MOSTRANDO O TEXTO ----------
    case "mostrar":
        tempo_credito -= 1;

        // Efeito de pulsação leve (zoom)
        escala = 1 + 0.05 * sin(current_time / 200);

        // Quando faltar pouco tempo, inicia o fade-out
        if (tempo_credito <= 30) estado_credito = "fade_out";
        break;

    // ---------- FADE OUT ----------
    case "fade_out":
        alpha_credito -= 0.03;
        escala -= 0.01;

        // Quando o fade termina, vai pra próxima room
        if (alpha_credito <= 0) {
            alpha_credito = 0;

            // 🔹 Reseta a fonte antes de mudar de room
            draw_set_font(-1); // -1 = volta à fonte padrão do sistema

            // 🔹 Troca pra sua room principal
            room_goto(Room1); // troque pelo nome da sua room principal
        }
        break;
}

