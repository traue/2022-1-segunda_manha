package br.urna.model;

public class Candidato {
    private int idCandidato;
    private int idEleicao;
    private String nomeCandidato;

    public Candidato() {
    }

    public Candidato(int idCandidato, int idEleicao, String nomeCandidato) {
        this.idCandidato = idCandidato;
        this.idEleicao = idEleicao;
        this.nomeCandidato = nomeCandidato;
    }

    public int getIdCandidato() {
        return idCandidato;
    }

    public void setIdCandidato(int idCandidato) {
        this.idCandidato = idCandidato;
    }

    public int getIdEleicao() {
        return idEleicao;
    }

    public void setIdEleicao(int idEleicao) {
        this.idEleicao = idEleicao;
    }

    public String getNomeCandidato() {
        return nomeCandidato;
    }

    public void setNomeCandidato(String nomeCandidato) {
        this.nomeCandidato = nomeCandidato;
    }
}
