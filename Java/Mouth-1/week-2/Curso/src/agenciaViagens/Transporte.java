package agenciaViagens;

public class Transporte {

    private String tipo;
    private double valor;

    public Transporte(int tipo, double valor) {

        if (tipo == 1) {
            this.tipo = "maritimo";
            this.valor = valor;
        }
        if (tipo == 2) {
            this.tipo = "rodoviário";
            this.valor = valor;
        }
        if (tipo == 3) {
            this.tipo = "aéreo";
            this.valor = valor;
        }

    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public double getValor() {
        return valor;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }
}
