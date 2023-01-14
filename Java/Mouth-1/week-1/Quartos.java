/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package curso;

import java.util.Scanner;
import java.util.ArrayList;


public class Quartos {
        public static void main(String[] args){
            
        Scanner ler = new Scanner(System.in);

        final int linha=4;
        final int coluna=3;
        
        boolean[][] quartos = new boolean[linha][coluna]; // cria uma matriz de 4x3 para os quartos

        while(true) {
            System.out.println("Informe Andar e Quarto: \n");
            System.out.println("Andar: \n");
            int andar = ler.nextInt() - 1; // subtrai 1 para que o usuário possa informar o quarto de 1 a 3
            System.out.println("quarto: \n");
            int quarto = ler.nextInt() - 1; // subtrai 1 para que o usuário possa informar o quarto de 1 a 3
            
            quartos[andar][quarto] = true; // marcar os quartos como ocupado
            
            System.out.println("Deseja informar outra ocupação? (S/N) \n");
            String opcao = ler.next().toUpperCase();
            if(!opcao.equals("S")){ // se a  resposta for diferente que S, encerra o loop
                break;
            }
        }
        for(int i = 0; i < quartos.length; i++){
                System.out.println((i + 1) + " andar:"); // mostra o andar atual
        for(int j = 0; j < quartos[i].length; j++){
                System.out.println("- Quarto " + (j + 1) + (quartos[i][j] ? " ocupado " : " desocupado ")); // mostra o quarto atual e se está ocupado ou desocupado
            }
        }
    }
}
