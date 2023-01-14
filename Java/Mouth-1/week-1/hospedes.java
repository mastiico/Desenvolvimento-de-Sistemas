package curso;

import java.util.Scanner;
import java.util.ArrayList;

public class hospedes {
    public static void main(String[] args){
    Scanner ler = new Scanner(System.in);
    ArrayList<String> hospedes = new ArrayList<String>();
        
        while(true) {
            System.out.println("Digite para escolher uma opcao\n 1- cadastrar;\n 2- pesquisar;\n 3- sair \n");
            int opcao = ler.nextInt();
            
            if(opcao == 1){
                System.out.println("Digite o nome do hospede: ");
                String nome = ler.nextLine();// ler o input do nome
                ler.nextLine(); // consumir o nome do hospede
                
                hospedes.add(nome);
                
            }else if(opcao == 2){
                System.out.println("Informe o nome do hospede a ser pesquisado: "); 
                String nome = ler.nextLine(); // ler o input do nome
                ler.nextLine(); // consumir o nome do pesquisado

                                
                int index = hospedes.indexOf(nome);
                if(index != -1){
                    System.out.println("Hospede " + nome + " foi encontrado no indice: " + index);
                }else{
                    System.out.println("Hospede " + nome +" nao encontrado");
                }    
            }else if(opcao == 3){
                break;
            }
        }
    }
}

