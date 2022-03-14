package br.uninove;

public class Bhaskara {

    public static double calculaDelta(int a, int b, int c) {
        float delta = (b * b) - 4 * a * c;
        return delta;
    }

    public static double calculaRaizPositiva(int a, int b, double delta) {
        double xP = (-b + Math.sqrt(delta)) / (2 * a);
        return xP;
    }

    public static double calculaRaizNegativa(int a, int b, double delta) {
        double xN = (-b - Math.sqrt(delta)) / (2 * a);
        return xN;
    }

}
