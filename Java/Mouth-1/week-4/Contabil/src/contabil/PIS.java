package contabil;

public class PIS implements Imposto {
    private float valorDebito;
    private float valorCredito;

    public PIS(float valorDebito, float valorCredito) {
        this.valorDebito = valorDebito;
        this.valorCredito = valorCredito;
    }

    public float getValorDebito() {
        return valorDebito;
    }

    public void setValorDebito(float valorDebito) {
        this.valorDebito = valorDebito;
    }

    public float getValorCredito() {
        return valorCredito;
    }

    public void setValorCredito(float valorCredito) {
        this.valorCredito = valorCredito;
    }

    @Override
    public String getDescricao() {
        return "----------PIS---------- \nValor debito: " + valorDebito + "\nValor credito: " + valorCredito + "\n";
    }

    @Override
    public float calcularImposto() {
        float diferenca = valorDebito - valorCredito;
        float imposto = diferenca * 0.0165f; // taxa de imposto fixa de 1,65%
        return imposto;
    }
}

