<%@page import="br.uninove.Bhaskara"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int a = Integer.parseInt(request.getParameter("valorA"));
    int b = Integer.parseInt(request.getParameter("valorB"));
    int c = Integer.parseInt(request.getParameter("valorC"));
    boolean erro = false;
    String msgErro = "";
    
    if(a < 0) {
        erro = true;
        msgErro = "O valor \"a\" não pode ser menor do que ZERO!";
    }
    
    
    double delta = Bhaskara.calculaDelta(a, b, c);
    //if (delta > 0) {
    double raizPositiva = Bhaskara.calculaRaizPositiva(a, b, delta);
    double raizNegativa = Bhaskara.calculaRaizNegativa(a, b, delta);
    //} else {
    //temos que pensar numa solução...
    //}

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bhaskara - Resultado</title>
    </head>
    <body>
        <h1>Bhaskara - Resultados</h1>
        <hr>
        <br>
        <p><b>Resultados, utilizando Bhaskara, da equação: </b><%=a%>x² + <%=b%>x + <%=c%> = 0</p>
        <br>
        <ul>
            <li>Δ = <%= delta %></li>
            <li>X' = <%= raizPositiva %></li>
            <li>X'' = <%= raizNegativa %></li>
        </ul>
        <br>
        <a href="./">Calcular novamente...</a>
    </body>
</html>
