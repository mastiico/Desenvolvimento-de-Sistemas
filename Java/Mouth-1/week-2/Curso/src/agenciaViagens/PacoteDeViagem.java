package agenciaViagens;

public class PacoteDeViagem {
    private Transporte transporte;
    private Hospedagem hospedagem;
    private String destino;
    private int qtdDias;
    private double margemLucro;
    private double taxasAdicionais;
    
    public PacoteDeViagem(Transporte transporte, Hospedagem hospedagem, String destino, int qtdDias, double margemLucro, double taxasAdicionais) {
        this.transporte = transporte;
        this.hospedagem = hospedagem;
        this.destino = destino;
        this.qtdDias = qtdDias;
        this.margemLucro = margemLucro;
        this.taxasAdicionais = taxasAdicionais;
    }

    public double calcularTotalHospedagem() {
        return hospedagem.getValorDiaria() * qtdDias;
    }

    public double calcularValorLucro(double valor) {
        return valor + (valor * (margemLucro/100));
    }

    public double calcularTotalPacote() {
        double totalHospedagem = calcularTotalHospedagem();
        double transporteComLucro = calcularValorLucro(transporte.getValor());
        double hospedagemComLucro = calcularValorLucro(totalHospedagem);
        return transporteComLucro + hospedagemComLucro + taxasAdicionais;
    }

    public Transporte getTransporte() {
        return transporte;
    }

    public void setTransporte(Transporte transporte) {
        this.transporte = transporte;
    }

    public Hospedagem getHospedagem() {
        return hospedagem;
    }

    public void setHospedagem(Hospedagem hospedagem) {
        this.hospedagem = hospedagem;
    }

    public String getDestino() {
        return destino;
    }

    public void setDestino(String destino) {
        this.destino = destino;
    }

    public int getQtdDias() {
        return qtdDias;
    }

    public void setQtdDias(int qtdDias) {
        this.qtdDias = qtdDias;
    }

    public double getMargemLucro() {
        return margemLucro;
    }

    public void setMargemLucro(double margemLucro) {
        this.margemLucro = margemLucro;
    }

    public double getTaxasAdicionais() {
        return taxasAdicionais;
    }

    public void setTaxasAdicionais(double taxasAdicionais) {
        this.taxasAdicionais = taxasAdicionais;
    }
}
