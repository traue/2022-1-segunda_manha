<%@page import="br.uninove.pojo.Imc"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   float peso;
   float altura;
   Imc imc = new Imc();
   
   peso = Float.parseFloat(request.getParameter("peso"));
   altura = Float.parseFloat(request.getParameter("altura"));
   
   //paramos aqui.. falta fazer o set dos valores, calcular e exibir

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Calculadora IMC - Resultado</title>
    </head>
    <body>
    </body>
</html>
