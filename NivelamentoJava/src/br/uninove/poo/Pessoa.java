package br.uninove.poo;

public class Pessoa {

    //Atributos (características) - Variáveis
    private String nome, email, cpf;
    private int idade;

    //Encapsulamento dos atributos (sets e gets):
    //Três "passos" para encapsular os campos:
    // 1 - Private neles
    // 2 - Implementar o Set para cada atributo
    // 3 - Implementar o Get para cada atributo
    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public int getIdade() {
        return idade;
    }

    public void setIdade(int idade) {
        this.idade = idade;
    }

    //Métodos (comportamentos)
    /*  este é um método que não retornar nada
        e não possui nenhum parâmetro de entrada */
    void fazerAniversario() {
        //idade = idade + 1; é o mesmo que..:
        setIdade(getIdade() + 1); //é o mesmo que idade = idade + 1;
        System.out.println("Ôba! Festinha. Quero bolo!");
        System.out.println("Agora o(a) " + getNome() + " tem " + getIdade() + " anos!");
    }
}
