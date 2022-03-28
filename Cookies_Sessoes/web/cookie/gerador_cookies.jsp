<%@page import="java.net.URLEncoder"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
    String nome = request.getParameter("nome");
    int idade = Integer.parseInt(request.getParameter("idade"));
    
    String nomeCodificado = URLEncoder.encode(nome, "UTF-8");
            
    Cookie cookieNome = new Cookie("nome_usuario", nomeCodificado);
    Cookie cookieIdade = new Cookie("idade_usuario", String.valueOf(idade));
    
    response.addCookie(cookieNome);
    response.addCookie(cookieIdade);
    
    //paramos aqui... falta "brincar" com o maxAge
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cookies geradas!</title>
        <link rel="stylesheet" href="../css/estilo.css">
    </head>
    <body>
        <h1>Cookies geradas...</h1>
        <hr>
        <div class="corpo">
            <ul>
                <li><b>Nome guardado:</b><%=nome%></li>
                <li><b>Idade guardada:</b><%=idade%></li>
            </ul>
        </div>
    </body>
</html>
