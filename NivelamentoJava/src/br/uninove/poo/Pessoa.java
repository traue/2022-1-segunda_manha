package br.uninove.poo;

public class Pessoa {

    //Atributos (características) - Variáveis
    private String nome;
    private String email;
    private String cpf;
    private int idade;
    private boolean fumante;

    public Pessoa() {
        nome = "";
        email = "";
        cpf = "";
        idade = 0;
    }

    public Pessoa(String nome, String email, String cpf, int idade, boolean fumante) {
        setNome(nome);
        setEmail(email);
        setIdade(idade);
        setCpf(cpf);
        setFumante(fumante);
    }

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

    public boolean isFumante() {
        return fumante;
    }

    public void setFumante(boolean fumante) {
        this.fumante = fumante;
    }

    //Métodos (comportamentos)
    /*  este é um método que não retorna nada
        e não possui nenhum parâmetro de entrada */
    void fazerAniversario() {
        //idade = idade + 1; é o mesmo que..:
        setIdade(getIdade() + 1); //é o mesmo que idade = idade + 1;
        System.out.println("Ôba! Festinha. Quero bolo!");
        System.out.println("Agora o(a) " + getNome() + " tem " + getIdade() + " anos!");
    }
}
