<%@page import="br.uninove.pojo.Imc"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    float peso;
    float altura;
    float resultado;
    String nome;
    Imc imc = new Imc();

    peso = Float.parseFloat(request.getParameter("peso"));
    altura = Float.parseFloat(request.getParameter("altura"));
    nome = request.getParameter("nomeUsuario");

    imc.setPeso(peso);
    imc.setAltura(altura);
    imc.setNome(nome);

    resultado = imc.calculaImc();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Calculadora IMC - Resultado</title>
    </head>
    <body>
        <h1>Calculadora IMC - Resultados</h1>
        <hr>
        <br>
        <br>
        <p>Resultados do IMC de <%= imc.getNome()%>:</p>
        <ul>
            <li><b>Peso informado: </b><%= String.format("%.2f", peso)%></li>
            <li><b>Altura informada: </b><%= String.format("%.2f", altura)%></li>
            <li><b>IMC: </b><%= String.format("%.2f", resultado)%></li>
            <li><b>Classificação: </b><%= imc.calculaClassificacao(resultado)%></li>
        </ul>
    </body>
</html>
