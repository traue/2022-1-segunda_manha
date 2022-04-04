<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String nome = "sem dados para exibir";
    int idade = -1;

    if (session.getAttribute("nomeUsuario") != null) {
        nome = (String) session.getAttribute("nomeUsuario");
    }

    if (session.getAttribute("idadeUsuario") != null) {
        idade = (int) session.getAttribute("idadeUsuario");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dados da sessão</title>
        <link rel="stylesheet" href="../css/estilo.css">
    </head>
    <body>
        <h1>Dados armazenados na sessão</h1>
        <hr>
        <div class="corpo">
            <ul>
                <li><b>Nome armazenado: </b><%= nome%></li>
                <% if (idade == -1) { %>
                    <li><b>Idade não armazenada!</b></li>
                <% } else {%>
                    <li><b>Idade armazenada: </b><%= idade%></li>
                <% }%>
            </ul>
        </div>
        <br>
        <a href="./">Voltar o projeto de sesões</a>
    </body>
</html>
