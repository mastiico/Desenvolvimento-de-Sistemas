
package curso;

import java.util.Scanner;

public class Convidados {
    public static void main(String[] args) {
        
          int convidados;
        
          Scanner leia = new Scanner(System.in);
          System.out.println("Ola, quantas pessoas sera convidada? ");
          convidados = leia.nextInt();
          
        if(convidados <= 350 && convidados > 220){
            System.out.println("Use o auditorio Beta e te sobrara " + (350 - convidados) + " Cadeiras");
        }if(convidados > 150 && convidados < 220){
            System.out.println("Use o auditorio Alfa e inclua " + (convidados - 150 ) + " Cadeiras");
        }if (convidados <= 150 && convidados < 220){
            System.out.println("Use o auditorio Alfa");
        }if(convidados <= 0 && convidados > 350) {
        System.out.println("“Número de convidados inválido");
        }
    }
}
