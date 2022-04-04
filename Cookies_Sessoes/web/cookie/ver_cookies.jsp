<%@page import="java.net.URLDecoder"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    
    String nomeCookie = "nome_usuario";
    String idadeCookie = "idade_usuario";

    Cookie cookieNomeUsuario = null;
    Cookie cookieIdadeUsuario = null;

    Cookie listaCookies[] = request.getCookies();

    if (listaCookies != null) {
        //vamos iniciar o processo de busca...

        //busca do nome:
        for (int i = 0; i < listaCookies.length; i++) {
            if (listaCookies[i].getName().equals(nomeCookie)) {
                cookieNomeUsuario = listaCookies[i];
                break;
            }
        }

        //busca da idade:
        for (int i = 0; i < listaCookies.length; i++) {
            if (listaCookies[i].getName().equals(idadeCookie)) {
                cookieIdadeUsuario = listaCookies[i];
                break;
            }
        }
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vendo as Cookies Geradas</title>
        <link rel="stylesheet" href="../css/estilo.css">
    </head>
    <body>
        <h1>Vendo as Cookies Geradas</h1>
        <hr>
        <div class="corpo">
            <!-- if do cookie que contém o nome do usuário: -->
            <% if (cookieNomeUsuario != null) {%>
            <p>
                <b>Nome do usuário armazenado na Cookie: </b>
                <%= URLDecoder.decode(cookieNomeUsuario.getValue(), "UTF-8")%>
            </p>
            <% } else { %>
            <p><b>Cookie que armazena o nome não encontrada! :(</b></p>
            <% } %>

            <br>
            
            <!-- if do cookie que contém a idade do usuário: -->
            <% if (cookieIdadeUsuario != null) {%>
            <p>
                <b>Idade do usuário armazenada na Cookie: </b>
                <%= URLDecoder.decode(cookieIdadeUsuario.getValue(), "UTF-8")%>
            </p>
            <% } else { %>
            <p><b>Cookie que armazena a idade não encontrada! :(</b></p>
            <% }%>
            
            <br><br>
            <a href="./">Voltar para o projeto de Cookies</a>
        </div>
    </body>
</html>
