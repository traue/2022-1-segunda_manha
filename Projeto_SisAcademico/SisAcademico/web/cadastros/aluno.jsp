<%@page import="br.sisacademico.model.Curso"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");
    
    String acao = "CADASTRO";
    String txtBotao = "Cadastrar";
    ArrayList<Curso> listaCursos = (ArrayList)session.getAttribute("listaCursos");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <jsp:include page="../menu.jsp"></jsp:include>
            <div class="container mt-4 pt-4">
                <div style="width: 40%; margin: 0 auto;">
                    <form method="post" action="../AlunoController">
                        
                        <div class="form-goup">
                            <label>RA</label>
                            <input type="number" class="form-control" required name="raAluno" maxlength="9" value="">
                        </div>

                        <div class="form-goup mt-4">
                            <label>Nome do Aluno</label>
                            <input type="text" class="form-control" required name="nomeAluno" maxlength="50" value="">
                        </div>

                        <div class="form-goup mt-4">
                            <label>Curso</label>
                            <select class="form-control" name="idCurso">
                            <% for(Curso c : listaCursos) { %>
                            <option value="<%=c.getIdCurso()%>"><%= c.getNomeCurso() + " (" + c.getTipoCurso() + ")"%></option>
                            <% } %>
                            </select>
                        </div>
                        
                        <div class="mt-4">
                            <input type="submit" class="btn btn-primary btn-md w-100" value="<%=txtBotao%>">
                        </div>

                        <input type="hidden" name="acao" value="<%=acao%>">
                </form>
            </div>
        </div>
    </body>
</html>
