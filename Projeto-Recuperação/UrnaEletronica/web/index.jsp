<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.invalidate();
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Urna Eletrônica</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet">
    </head>
    <body>
        <% if (request.getParameter("erroLogin") != null && Boolean.parseBoolean(request.getParameter("erroLogin"))) { %>
        <div class="alertaLogin">
            <p>Erro de autenticação!</p>
        </div> 
        <% }%>
        <div class="formLogin">
            <form method="post" action="LoginController">
                <div class="form-group">
                    <label>Usuário</label>
                    <input type="text" class="form-control w-100" name="usuario" required>
                </div>

                <div class="form-group mt-4">
                    <label>Senha</label>
                    <input type="password" class="form-control w-100" name="senha" required>
                </div>

                <div class="form-group mt-4">
                    <input type="submit" value="Entrar" class="btn btn-info w-100">
                </div>
            </form>
        </div>
    </body>
</html>
