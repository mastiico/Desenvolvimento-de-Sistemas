package contabil;

public class IPI implements Imposto {
    private float valorProduto;
    private float frete;
    private float seguro;
    private float outrasDespesas;
    private float aliquota;

    public IPI(float valorProduto, float frete, float seguro, float outrasDespesas, float aliquota) {
        this.valorProduto = valorProduto;
        this.frete = frete;
        this.seguro = seguro;
        this.outrasDespesas = outrasDespesas;
        this.aliquota = aliquota;
    }

    @Override
    public float calcularImposto() {
        float baseCalculo = valorProduto + frete + seguro + outrasDespesas;
        return (float) (baseCalculo * (aliquota/100.0));
    }

    @Override
    public String getDescricao() {
        return "IPI";
    }

    // Getters
    public float getValorProduto() {
        return valorProduto;
    }

    public float getFrete() {
        return frete;
    }

    public float getSeguro() {
        return seguro;
    }

    public float getOutrasDespesas() {
        return outrasDespesas;
    }

    public float getAliquota() {
        return aliquota;
    }

    // Setters
    public void setValorProduto(float valorProduto) {
        this.valorProduto = valorProduto;
    }

    public void setFrete(float frete) {
        this.frete = frete;
    }

    public void setSeguro(float seguro) {
        this.seguro = seguro;
    }

    public void setOutrasDespesas(float outrasDespesas) {
        this.outrasDespesas = outrasDespesas;
    }

    public void setAliquota(float aliquota) {
        this.aliquota = aliquota;
    }
}


