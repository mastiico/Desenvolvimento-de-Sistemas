package contabil;

import java.util.Scanner;

public class Main {

    public static void main(String[] args) {

        Scanner input = new Scanner(System.in);

        System.out.println("Digite o nome da empresa:");
        String nomeEmpresa = input.nextLine();

        Pagamentos pagamentos = new Pagamentos(nomeEmpresa);

        while (true) {

            System.out.println("Digite o tipo de imposto (PIS ou IPI) ou 'pare' para encerrar:");
            String tipoImposto = input.nextLine().toUpperCase();

            if (tipoImposto.equals("PARE")) {
                break;
            }

            Imposto imposto;

            if (tipoImposto.equals("PIS")) {
                System.out.println("Digite o valor total de débito:");
                float debito = input.nextFloat();
                input.nextLine();
                System.out.println("Digite o valor total de crédito:");
                float credito = input.nextFloat();
                input.nextLine();
                imposto = new PIS(debito, credito);
            } else if (tipoImposto.equals("IPI")) {
                System.out.println("Digite o valor do produto:");
                float valorProduto = input.nextFloat();
                input.nextLine();
                System.out.println("Digite o valor do frete:");
                float frete = input.nextFloat();
                input.nextLine();
                System.out.println("Digite o valor do seguro:");
                float seguro = input.nextFloat();
                input.nextLine();
                System.out.println("Digite o valor de outras despesas:");
                float outrasDespesas = input.nextFloat();
                input.nextLine();
                System.out.println("Digite o percentual aliquota:");
                float aliquota = input.nextFloat();
                input.nextLine();
                imposto = new IPI(valorProduto, frete, seguro, outrasDespesas, aliquota);
            } else {
                System.out.println("Tipo de imposto inválido.");
                continue;
            }

            pagamentos.adicionarImposto(imposto);

        }

        System.out.println("\nImpostos pagos pela empresa " + nomeEmpresa + ":");

        for (Imposto imposto : pagamentos.getImpostos()) {
            System.out.println(imposto.getDescricao() + "\nValor total: R$" + imposto.calcularImposto());
        }

    }

}
