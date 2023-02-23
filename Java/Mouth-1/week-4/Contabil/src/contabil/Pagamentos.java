package contabil;

import java.util.ArrayList;
import java.util.List;

public class Pagamentos {
    
    private String nomeEmpresa;
    private List<Imposto> impostos = new ArrayList<>();
    
    public Pagamentos(String nomeEmpresa) {
        this.nomeEmpresa = nomeEmpresa;
    }

    public String getNomeEmpresa() {
        return nomeEmpresa;
    }

    public void setNomeEmpresa(String nomeEmpresa) {
        this.nomeEmpresa = nomeEmpresa;
    }

    public List<Imposto> getImpostos() {
        return impostos;
    }

    public void setImpostos(List<Imposto> impostos) {
        this.impostos = impostos;
    }
    
    // método para adicionar um imposto à lista
    public void adicionarImposto(Imposto imposto) {
        impostos.add(imposto);
    }
    
    // método para calcular o valor total de impostos a serem pagos
    public double calcularTotalImpostos() {
        double total = 0.0;
        for (Imposto imposto : impostos) {
            total += imposto.calcularImposto();
        }
        return total;
    }
    
    // método para imprimir os impostos e seus respectivos valores
    public void imprimirImpostos() {
        for (Imposto imposto : impostos) {
            System.out.println(imposto.getDescricao() + ": " + imposto.calcularImposto());
        }
    }

    // método para retornar a lista de impostos
    public List<Imposto> getListaImpostos() {
        return this.impostos;
    }
}
