package br.uninove.pojo;

public class Bhaskara {

    private int a;
    private int b;
    private int c;
    private double delta;
    private double raizPos;
    private double raizNeg;

    public int getA() {
        return a;
    }

    public void setA(int a) {
        this.a = a;
    }

    public int getB() {
        return b;
    }

    public void setB(int b) {
        this.b = b;
    }

    public int getC() {
        return c;
    }

    public void setC(int c) {
        this.c = c;
    }

    public double getDelta() {
        return delta;
    }

    public void setDelta(double delta) {
        this.delta = delta;
    }

    public double getRaizPos() {
        return raizPos;
    }

    public void setRaizPos(double raizPos) {
        this.raizPos = raizPos;
    }

    public double getRaizNeg() {
        return raizNeg;
    }

    public void setRaizNeg(double raizNeg) {
        this.raizNeg = raizNeg;
    }

    public double calculaDelta() {
        setDelta((getB() * getB()) - 4 * getA() * getC());
        return getDelta();
    }

    public void calculaBhaskara() {
        if (delta > 0) {
            setRaizPos((-getB() + Math.sqrt(getDelta())) / (2 * getA()));
            setRaizNeg((-getB() - Math.sqrt(getDelta())) / (2 * getA()));
        }
    }

}
