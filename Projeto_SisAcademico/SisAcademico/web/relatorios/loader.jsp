<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <jsp:include page="../menu.jsp"></jsp:include>
        
        <script>
            $(document).ready(function () {
                const urlParams = new URLSearchParams(window.location.search);
                const pagina = urlParams.get('pagina');
                
                if(pagina == 'aluno') {
                    var url = '../AlunoController?acao=LEITURA';
                    const idCurso = urlParams.get('idCurso');
                    if(idCurso != null) {
                        url += '&idCurso=' + idCurso;
                    }
                } else {
                    var url = '../CursoController?acao=LEITURA';
                }
                
                $(location).attr('href', url);
            });
        </script>
        
        <div class="text-center mt-4, pt-4">
            <img src="../img/loading.gif" alt="Carregando...">
        </div>
    </body>
</html>
