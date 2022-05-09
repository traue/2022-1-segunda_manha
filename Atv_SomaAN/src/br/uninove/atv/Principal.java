package br.uninove.atv;

import java.util.Scanner;

public class Principal {
    public static void main(String[] args) {
        int a, n;
        Scanner sc = new Scanner(System.in);
        
        System.out.print("Informa o valor de \"a\": ");
        a = sc.nextInt();
        
        System.out.print("Informa o valor de \"N\": ");
        n = sc.nextInt();
        
        System.out.println(somaAN(a, n));
        
    }
    
    
    public static String somaAN(int a, int n) {
        int contador, aux;
        String saida = a + " + ";
        contador = aux = a;
        for(int i = 1; i < n; i++) {
            contador += (a + i);
            aux = a + i;
            saida += aux;
            if(i != n - 1) {
                saida += " + ";
            }
        }
        
        return saida + " = " + contador;
    }
}
