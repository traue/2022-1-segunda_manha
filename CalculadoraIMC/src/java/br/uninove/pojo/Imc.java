package br.uninove.pojo;

public class Imc {
    private float peso;
    private float altura;

    public float getPeso() {
        return peso;
    }

    public void setPeso(float peso) {
        this.peso = peso;
    }

    public float getAltura() {
        return altura;
    }

    public void setAltura(float altura) {
        this.altura = altura;
    }
    
    public float calculaImc() {
        float resultado = peso / (altura * altura);
        return resultado;
    }
}
