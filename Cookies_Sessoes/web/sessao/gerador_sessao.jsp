<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");

    String nome = request.getParameter("nome");
    int idade = Integer.parseInt(request.getParameter("idade"));
    
    session.setAttribute("nomeUsuario", nome);
    session.setAttribute("idadeUsuario", idade);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dados na sessão</title>
        <link rel="stylesheet" href="../css/estilo.css">
    </head>
    <body>
        <h1>Dados armazenados na sessão...:</h1>
        <hr>
        <div class="corpo">
            <ul>
                <li><b>Nome guardado: </b><%=nome%></li>
                <li><b>Idade guardada: </b><%=idade%></li>
            </ul>
            <br>
            <a href="./">Voltar para o início do projeto de Sessões</a>
        </div>
    </body>
</html>
