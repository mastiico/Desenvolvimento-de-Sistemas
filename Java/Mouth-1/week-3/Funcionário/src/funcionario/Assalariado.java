package Funcionario;

public class Assalariado extends Funcionarios{
    private double salario;
    
    public Assalariado(String nome, String cpf, String endereco, String telefone, String setor, double salario) {
        super(nome, cpf, endereco, telefone, setor);
        this.salario = salario;
    }
    
    @Override
    public double calcularPagamento() {
        return salario;
    }
}

