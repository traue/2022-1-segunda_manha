<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="bhaskara" scope="page" class="br.uninove.Bhaskara"></jsp:useBean>
<%
    int valorA = Integer.parseInt(request.getParameter("valorA"));
    int valorB = Integer.parseInt(request.getParameter("valorB"));
    int valorC = Integer.parseInt(request.getParameter("valorC"));
%>
<jsp:setProperty name="bhaskara" property="a" value="<%=valorA%>"></jsp:setProperty>
<jsp:setProperty name="bhaskara" property="b" value="<%=valorB%>"></jsp:setProperty>
<jsp:setProperty name="bhaskara" property="c" value="<%=valorC%>"></jsp:setProperty>

<%
    bhaskara.calculaBhaskara();
    boolean erro = false;
    String msgErro = "";

    if (bhaskara.getA() == 0) {
        erro = true;
        msgErro = "Valor \"a\" não pode ser zero! Isso torna a equação de priemiro grau!";
    }

    if (bhaskara.getDelta() < 0) {
        erro = true;
        msgErro = "Delta deu negativo (" + bhaskara.getDelta() + "). Impossível calcular as raízes.";
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bhaskara - Resultado</title>
        <style>
            .resultados {
                margin-left: 30px;
                margin-top: 30px;
                font-size: 24px;
            }
        </style>
    </head>
    <body>
        <h1>Bhaskara - Resultados</h1>
        <hr>
        <% if (erro) {%>
            <div class="resultados">

                <h2>Ops... algo deu errado:</h2>
                <p><%=msgErro%></p>

            </div>
        <% } else {%>
            <div class="resultados">
                <p><b>Resultados, utilizando Bhaskara, da equação: </b><%=valorA%>x² + <%=valorB%>x + <%=valorC%> = 0</p>
                <br>
                <ul>
                    <li>Δ = <%= bhaskara.getDelta() %></li>
                    <li>X' = <%= bhaskara.getRaizPos() %></li>
                    <li>X'' = <%= bhaskara.getRaizNeg() %></li>
                </ul>
            </div>
        <% }%>   
        <a href="./">Calcular novamente...</a>
    </body>
</html>
