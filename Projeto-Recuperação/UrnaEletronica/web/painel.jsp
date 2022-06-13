<%@page import="br.urna.model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Usuario sysUser = null;
    if (session.getAttribute("user") != null) {
        sysUser = (Usuario) session.getAttribute("user");
    } else {
        response.sendRedirect("./?erroLogin=true");
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Urna Eletrônica - Painel</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet">
    </head>
    <body>
        <div class="container">
            <div class="signout">
                <a href="./" class="btn btn-success">Sair</a>
            </div>
            <div class="painel">
                botão para votar
            </div>
            
            <div class="painel">
                botão para ver resultados
            </div>
            
            <div class="painel">
                botão para ver eleições disponíveis
                botão para cadastrar eleição
                botão para cadastrar candidatos
            </div>
            
        </div>
    </body>
</html>
