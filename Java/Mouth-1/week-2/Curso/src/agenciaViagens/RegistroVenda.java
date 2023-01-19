package agenciaViagens;

import java.util.Scanner;

public class RegistroVenda {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        while (true) {
            System.out.print("\n! Seja bem vindo(a) ao **registro** de venda de Pacote ! \n");
            System.out.print("\nPara continuar, digite: \n1 - Cadastrar pacotes \n2 - Sair\n");
            int opcao = sc.nextInt();
            sc.nextLine();

            if (opcao == 1) {
                // Obtendo informações para criar o transporte
                System.out.print("Informe o tipo de transporte: \n1 - Maritimo\n2 - Rodoviário\n3 - Aéreo\n");
                int tipoTransporte = sc.nextInt();
                if (tipoTransporte >= 1 && tipoTransporte <= 3) {
                    System.out.print("\nInforme o valor do transporte: $");
                    double valorTransporte = sc.nextDouble();
                    Transporte transporte = new Transporte(tipoTransporte, valorTransporte);

                    // Obtendo informações para criar a hospedagem
                    System.out.print("\nInforme a descrição da hospedagem: ");
                    sc.nextLine();
                    String descricaoHospedagem = sc.nextLine();
                    System.out.print("Informe o valor da diária da hospedagem: $");
                    double valorDiaria = sc.nextDouble();
                    Hospedagem hospedagem = new Hospedagem(descricaoHospedagem, valorDiaria);

                    // Obtendo informações para criar o pacote de viagem
                    System.out.print("\nInforme o destino da viagem: ");
                    sc.nextLine();
                    String destino = sc.nextLine();
                    System.out.print("Informe a quantidade de dias da viagem: ");
                    int qtdDias = sc.nextInt();
                    System.out.print("\nInforme a margem de lucro (em porcentagem): %");
                    double margemLucro = sc.nextDouble();
                    System.out.print("\nInforme as taxas adicionais: $");
                    double taxasAdicionais = sc.nextDouble();
                    PacoteDeViagem pacoteViagem = new PacoteDeViagem(transporte, hospedagem, destino, qtdDias, margemLucro, taxasAdicionais);

                    // Mostrando informações do pacote criado
                    System.out.println("\nInformações do pacote criado:");
                    System.out.println("Destino: " + pacoteViagem.getDestino());
                    System.out.println("Quantidade de dias: " + pacoteViagem.getQtdDias());
                    System.out.println("Valor total do pacote: $" + pacoteViagem.calcularTotalPacote() + " dólares");

                    // Obtendo informações para criar a venda
                    System.out.print("\nInforme o nome do cliente: ");
                    sc.nextLine();
                    String nomeCliente = sc.nextLine();
                    System.out.print("Informe a forma de pagamento: ");
                    String formaPagamento = sc.nextLine();
                    System.out.print("Informe a cotação do dólar no dia: ");
                    double cotacaoDolar = sc.nextDouble();
                    Venda venda = new Venda(nomeCliente, formaPagamento, pacoteViagem, cotacaoDolar);
                    System.out.println("\n> Informações da venda <\n");
                    System.out.println("Nome do cliente: " + venda.getNomeCliente());
                    System.out.println("Forma de pagamento: " + venda.getFormaPagamento());
                    System.out.println("Cotação do dólar no dia: " + venda.getCotacaoDolar() + "\n");
                    venda.mostrarTotal();// Mostrando informações da venda
                } else {
                    System.out.println("\nTransporte inválido");
                }

            }
            if (opcao == 2) {
                break;
            }
            if (opcao > 2 || opcao <= 0) {
                System.out.println("Opção invalida!\n");
            }
        }
    }
}
