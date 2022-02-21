package br.uninove.poo;

import java.util.Scanner;

public class Principal {

    public static void main(String[] args) {
        Pessoa p = new Pessoa();
        Scanner sc = new Scanner(System.in);

//        System.out.println("Dados do objeto \"p\" que é instância de \"Pessoa\":");
//        System.out.println("Nome da pessoa: " + p.getNome());
//        System.out.println("E-mail da pessoa: " + p.getEmail());
//        System.out.println("CPF da pessoa: " + p.getCpf());
//        System.out.println("Idade da pessoa: " + p.getIdade());
//        System.out.println("É fumante?" + p.isFumante());
        System.out.print("Informe seu nome: ");
        p.setNome(sc.nextLine());

        System.out.print("Informe seu e-mail: ");
        p.setEmail(sc.nextLine());

        System.out.print("Informe seu CPF: ");
        p.setCpf(sc.nextLine());

        System.out.print("informe sua idade: ");
        p.setIdade(sc.nextInt());
        
        System.out.print("Você é fumante [S/N]? ");
        char r = sc.next().charAt(0);
        if(r == 's' || r == 'S') {
            p.setFumante(true);
        } else if (r == 'n' || r == 'N') {
            p.setFumante(false);
        } else {
            System.out.println("Não consegui determinar se é fumante ou não");
            p.setFumante(false);
        }
                                        
        System.out.println("\n-------------------------------");
        System.out.println("Nome da pessoa: " + p.getNome());
        System.out.println("E-mail da pessoa: " + p.getEmail());
        System.out.println("CPF da pessoa: " + p.getCpf());
        System.out.println("Idade da pessoa: " + p.getIdade());
        System.out.println("É fumante: " + (p.isFumante() ? "Sim" : "Não"));
        
        
        Pessoa p2 = new Pessoa("Traue", "Trau@gmail.com", "123", 34, false);
        
        Aluno a = new Aluno();
        a.setNome("Rômulo");
        a.setCpf("6660606");
        a.setEmail("romulinho@uni9.edu.br");
        a.setFumante(true);
        a.setRa(98980123);
        a.setCurso("Ciência da Computação");
        
    }
}
