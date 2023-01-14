package curso;

import java.util.Scanner;

public class diaria {
    public static void main(String[] args){
        
        Scanner ler = new Scanner(System.in);
        int diaria = 100;
        int meia = 50;
        int qntdiaria = 0;
        int qntmeia = 0;
        int idade;
        int qntgratuito = 0;
        String nome;
        
        System.out.print("Digite o nome e a idade (ou digite 'PARE' para parar): \n");

         while(true) {
            System.out.print("Digite o nome: ");
            nome = ler.nextLine();
            nome = ler.nextLine();
            if(nome.equals("PARE")) {
                break;
            }
            System.out.print("Digite a idade: ");
            idade = ler.nextInt();
            System.out.print("\n");
            if(idade < 4 ){ 
            System.out.print(nome + " possui gratuidade \n");
            System.out.print("\n");
            qntgratuito++;
            }else if(idade > 80){
            System.out.print(nome + " paga meia \n");
            System.out.print("\n");
            qntmeia++;
            }else{
                qntdiaria++;
            }
        }
        System.out.print("\n");
        System.out.print("Valor total de hospedagens: R$" + (qntdiaria*diaria + qntmeia*50 )+ "; \n" + qntgratuito + " gratuidade(s); \n" + qntmeia + " meia(s) \n");
    }
}
