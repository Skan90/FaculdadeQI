import java.util.Scanner;
import java.util.Random;
//Jogo de Jokenp� Desenvolvido na faculdade para Algoritmos e Programa��o
//Jakenpo game developed at college for Algorithms and Programming
//Rafael da Silva Santos

public class PedraPapelTesoura {

    public static void main(String[] args) {
    	//Welcome message
        System.out.println("Bem-vindo (a) ao Jokenp� da QI!");
        System.out.println("Vamos descobrir se o homem � melhor que a m�quina?\n");
        
        //Rules of the game, best of 3.
        System.out.println("As regras s�o simples:");
        System.out.println("Pedra quebra a Tesoura");
        System.out.println("Papel embrulha a Pedra");
        System.out.println("Tesoura corta o Papel");
        System.out.println("\nVamos come�ar?\nQuem vencer tr�s vezes primeiro ganha.");

	    int placarJogador = 0;
		int placarComputador = 0;
		
		//Counter for the best of three
		while (placarJogador != 3 && placarComputador != 3) {    
	        System.out.println("\nArmas em jogo:");
	        System.out.println("1 - Pedra");
	        System.out.println("2 - Papel");
	        System.out.println("3 - Tesoura\n");
	        
	        int jogador;
	        Scanner teclado = new Scanner(System.in);
	        System.out.println("Escolha um dos n�meros:");
	        jogador = teclado.nextInt();
	        
	        //Player's can only choose numbers between 1 and 3, otherwise they'll be stuck in this loop 
	        if (jogador > 3 || jogador < 1)
	        	while (jogador > 3 || jogador < 1) {
	        	System.out.println("Escolha apenas um n�mero entre 1 e 3:\n");
	        	jogador = teclado.nextInt();
	        	
	        }
	        
	        Random random = new Random();
	        int computador = random.nextInt(3) + 1;
	        System.out.print("\nO computador escolheu:\n" + computador + "\n\n");
	        
	        //Counter increment for draws
	        //Empates para incremento do contador em ambos
	        if (jogador == 1 && computador == 1) {

		        placarJogador = placarJogador +1;
		        placarComputador = placarComputador +1;
		        System.out.println("Voc�s dois escolheram PEDRA: Empate.\n");
	        }
	        if (jogador == 2 && computador == 2) {

		        placarJogador = placarJogador +1;
		        placarComputador = placarComputador +1;
		        System.out.println("Voc�s dois escolheram PAPEL: Empate.\n");
	        }
	        if (jogador == 3 && computador == 3) {

		        placarJogador = placarJogador +1;
		        placarComputador = placarComputador +1;
		        System.out.println("Voc�s dois escolheram TESOURA: Empate.\n");
	        }
	        
	        //Counter increment for computer's victory 
	        //Vit�rias do Computador para incremento do contador
	        if (jogador == 1 && computador == 2) {
	        	
		        placarComputador = placarComputador +1;
		        System.out.println("Voc� escolheu PEDRA e o computador PAPEL.\nO computador venceu essa rodada.\n");
	        }
	        if (jogador == 2 && computador == 3) {
	        	
		        placarComputador = placarComputador +1;
		        System.out.println("Voc� escolheu PAPEL e o computador TESOURA.\nO computador venceu essa rodada.\n");
	        }
	        if (jogador == 3 && computador == 1) {
	        	
		        placarComputador = placarComputador +1;
		        System.out.println("Voc� escolheu TESOURA e o computador PEDRA.\nO computador venceu essa rodada.\n");
	        }
	        //Counter increment for player's victory 
	        //Vit�rias do Jogador para incremento do contador
	        if (jogador == 1 && computador == 3) {
	        	
		        placarJogador = placarJogador +1;
		        System.out.println("Voc� escolheu PEDRA e o computador TESOURA.\nVoc� venceu essa rodada.\n");
	        }
	        if (jogador == 2 && computador == 1) {
	        	
	        	placarJogador = placarJogador +1;
		        System.out.println("Voc� escolheu PAPEL e o computador PEDRA.\nVoc� venceu essa rodada.\n");
	        }
	        if (jogador == 3 && computador == 2) {
	        	
	        	placarJogador = placarJogador +1;
		        System.out.println("Voc� escolheu TESOURA e o computador PAPEL.\nVoc� venceu essa rodada.\n");
	        }
	        System.out.println("Placar at� o momento:\n");
	        System.out.println("Vit�rias do Jogador:" + placarJogador);
	        System.out.println("Vit�rias do Computador:" + placarComputador);
	    }
	    
		
	System.out.println("\n\nFINAL DE JOGO! \n ");
	if (placarJogador == 3 && placarComputador != 3)
		System.out.println("O JOGADOR VENCEU!\nSarah Connor seja louvada!"); //Sarah Connor be praised!
		
	if (placarComputador == 3 && placarJogador != 3)
		System.out.println("O COMPUTADOR VENCEU!\nO levante das m�quinas est� cada dia mais pr�ximo."); //The machines uprising  is closer each day.
		
	if (placarComputador == 3 && placarJogador == 3)
		System.out.println("TEMOS UM EMPATE!\nAinda h� esperan�a para a humanidade."); //There's still hope for humanity.
	
	//PS.: Minha filha se chama Sarah <3
	//PS.: My daughter's name is Sarah
}
}
