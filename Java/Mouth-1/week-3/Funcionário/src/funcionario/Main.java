package Funcionario;

import java.util.ArrayList;
import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        ArrayList<Funcionarios> funcionarios = new ArrayList<>();

        for (int i = 0; i < 2; i++) {
            System.out.println("Cadastro do funcionário " + (i + 1));
            System.out.print("Informe o nome: ");
            String nome = sc.nextLine();
            System.out.print("Informe o CPF: ");
            String cpf = sc.nextLine();
            System.out.print("Informe o endereço: ");
            String endereco = sc.nextLine();
            System.out.print("Informe o telefone: ");
            String telefone = sc.nextLine();
            System.out.print("Informe o setor: ");
            String setor = sc.nextLine();
            System.out.print("Informe o tipo de funcionário (assalariado ou horista): ");
            String tipo = sc.nextLine();

            if (tipo.equalsIgnoreCase("assalariado")) {
                System.out.print("Informe o salário: ");
                double salario = sc.nextDouble();
                sc.nextLine();
                funcionarios.add(new Assalariado(nome, cpf, endereco, telefone, setor, salario));
            } else if (tipo.equalsIgnoreCase("horista")) {
                System.out.print("Informe o número de horas trabalhadas: ");
                double horasTrabalhadas = sc.nextDouble();
                System.out.print("Informe o valor da hora: ");
                double valorHora = sc.nextDouble();
                sc.nextLine();
                funcionarios.add(new Horista(nome, cpf, endereco, telefone, setor, horasTrabalhadas, valorHora));
            } else {
                System.out.println("Tipo inválido, por favor, informe novamente.");
                i--;
            }
        }

        System.out.println("Dados dos funcionários:");
        for (Funcionarios funcionario : funcionarios) {
            System.out.println("Nome: " + funcionario.getNome());
            System.out.println("CPF: " + funcionario.getCpf());
            System.out.println("Endereço: " + funcionario.getEndereco());
            System.out.println("Telefone: " + funcionario.getTelefone());
            System.out.println("Setor: " + funcionario.getSetor());
            System.out.println("Pagamento: " + funcionario.calcularPagamento());
            System.out.println("\n");
        }
        System.out.print("\nDigite a porcentagem de aumento para todos os funcionários: ");
        double percentualAumento = sc.nextDouble();
        for (Funcionarios funcionario : funcionarios) {
            funcionario.aplicarAumento(percentualAumento);
            System.out.println("pagamento para " + funcionario.getNome() + ": " + funcionario.getPagamento() );
        }
    }
}
