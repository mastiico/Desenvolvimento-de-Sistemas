package curso;

import java.util.Scanner;

public class Desconto {
        public static void main(String[] args) {
            
        Scanner leia = new Scanner(System.in);

            
        String nome1;
        String nome2;
        int idade1;
        int idade2;
        
        System.out.println("Ola, informe o nome do primeiro hospede: ");
        nome1 = leia.nextLine();
        
        System.out.println("informe a idade do primeiro hospede: ");
        idade1 = leia.nextInt();
        
        System.out.println("informe o nome do segundo hospede: ");
        nome2 = leia.nextLine();
        nome2 = leia.nextLine();
        
        System.out.println("informe a idade do segundo hospede: ");
        idade2 = leia.nextInt();
        
        if(idade1 > idade2){
            System.out.println("Quarto A: " + nome1 + " com desconto de 40%; " + "Quarto B: " + nome2);
        }if(idade2 > idade1){
            System.out.println("Quarto A: " + nome2 + " com desconto de 40%; " + "Quarto B: " + nome1);
        }
    }
}
