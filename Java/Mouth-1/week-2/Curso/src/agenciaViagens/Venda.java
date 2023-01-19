package agenciaViagens;

public class Venda {
    private String nomeCliente;
    private String formaPagamento;
    private PacoteDeViagem pacoteViagem;
    private double cotacaoDolar;

    public Venda(String nomeCliente, String formaPagamento, PacoteDeViagem pacoteViagem, double cotacaoDolar) {
        this.nomeCliente = nomeCliente;
        this.formaPagamento = formaPagamento;
        this.pacoteViagem = pacoteViagem;
        this.cotacaoDolar = cotacaoDolar;
    }

    public double converterReais(double valorDolar) {
        return valorDolar * cotacaoDolar;
    }

    public void mostrarTotal() {
        double totalPacote = pacoteViagem.calcularTotalPacote();
        System.out.println("Total do pacote em dólar: $" + totalPacote);
        System.out.println("Total do pacote em reais: R$" + converterReais(totalPacote));
    }

    public String getNomeCliente() {
        return nomeCliente;
    }

    public void setNomeCliente(String nomeCliente) {
        this.nomeCliente = nomeCliente;
    }

    public String getFormaPagamento() {
        return formaPagamento;
    }

    public void setFormaPagamento(String formaPagamento) {
        this.formaPagamento = formaPagamento;
    }

    public PacoteDeViagem getPacoteViagem() {
        return pacoteViagem;
    }

    public void setPacoteViagem(PacoteDeViagem pacoteViagem) {
        this.pacoteViagem = pacoteViagem;
    }

    public double getCotacaoDolar() {
        return cotacaoDolar;
    }

    public void setCotacaoDolar(double cotacaoDolar) {
        this.cotacaoDolar = cotacaoDolar;
    }
}
