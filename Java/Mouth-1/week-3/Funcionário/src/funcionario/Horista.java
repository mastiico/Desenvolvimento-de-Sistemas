package Funcionario;

public class Horista extends Funcionarios{
    private double horasTrabalhadas;
    private double valorHora;
    
    public Horista(String nome, String cpf, String endereco, String telefone, String setor, double horasTrabalhadas, double valorHora) {
        super(nome, cpf, endereco, telefone, setor);
        this.horasTrabalhadas = horasTrabalhadas;
        this.valorHora = valorHora;
    }
    
    @Override
    public double calcularPagamento() {
        return horasTrabalhadas * valorHora;
    }
}

