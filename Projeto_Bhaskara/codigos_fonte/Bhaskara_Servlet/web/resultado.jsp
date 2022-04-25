<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String a, b, c, delta, rP, rN;
    boolean temRaizes = false;
    a = request.getParameter("a");
    b = request.getParameter("b");
    c = request.getParameter("c");
    rP = rN = "";
    delta = request.getParameter("delta");
    
    if(request.getParameter("rP") != null) {
        rP = request.getParameter("rP");
        rN = request.getParameter("rN");
        temRaizes = true;
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bhaskara - Resultados</title>
        <link rel="stylesheet" href="css/estilo.css">
    </head>
    <body>
        <h1>Bhaskara - Resultados</h1>
        <hr>
        <div class="corpo">
            <h3>Dada a equação <%=a%>x² + <%=b%>x + <%=c%> = 0, temos...:</h3>
            <ul>
                <li>Delta: <%=delta%></li>
                <% if(temRaizes) { %>
                <li>X' = <%=rP%></li>
                <li>X" = <%=rN%></li>
                <% } else { %>
                <li>Não há raízs pois delta é negtivo!</li>
                <% } %>
            </ul>
            <a href="./">Calcular novamente...</a>
        </div>
    </body>
</html>
