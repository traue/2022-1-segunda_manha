<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <jsp:include page="../menu.jsp"></jsp:include>
        <div class="container mt-4 pt-4">
            <div style="width: 40%; margin: 0 auto;">
                <form method="post" action="../CursoController">
                    <div class="form-goup">
                        <label>Nome do Curso:</label>
                        <input type="text" class="form-control" required name="nomeCurso" maxlength="90">
                    </div>
                    
                    <div class="form-goup mt-4">
                        <label>Tipo de Curso:</label>
                        <input type="text" class="form-control" required name="tipoCurso" maxlength="50">
                    </div>
                    
                    <div class="mt-4">
                        <input type="submit" class="btn btn-primary btn-md w-100" value="Cadastrar">
                    </div>
                    
                    <input type="hidden" name="acao" value="CADASTRO">
                    
                </form>
            </div>
        </div>
    </body>
</html>
