<%@page import="br.sisacademico.model.Curso"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    response.setContentType("text/html;charset=UTF-8");
    request.setCharacterEncoding("UTF-8");

    String acao = "CADASTRO";
    String txtBotao = "Cadastrar";
    ArrayList<Curso> listaCursos = (ArrayList) session.getAttribute("listaCursos");
    String nomeAluno = "";
    String ra = "";
    String idAluno = "";
    int idCurso = -1;
    String disabled = "";

    if (request.getParameter("idAluno") != null) {
        nomeAluno = request.getParameter("nome");
        ra = request.getParameter("ra");
        idAluno = request.getParameter("idAluno");
        idCurso = Integer.parseInt(request.getParameter("idCurso"));
        acao = "EDICAO";
        txtBotao = "Atualizar este Aluno";
        disabled = "disabled";
    }
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
                            <input type="number" class="form-control" <%=disabled%> required name="raAluno" maxlength="9" value="<%=ra%>">
                    </div>

                    <div class="form-goup mt-4">
                        <label>Nome do Aluno</label>
                        <input type="text" class="form-control" required name="nomeAluno" maxlength="50" value="<%=nomeAluno%>">
                    </div>

                    <div class="form-goup mt-4">
                        <label>Curso</label>
                        <select class="form-control" name="idCurso">
                            <%
                                for (Curso c : listaCursos) {
                                    String opc = "";
                                    if (c.getIdCurso() == idCurso)
                                        opc = "selected";
                            %>

                            <option <%=opc%> value="<%=c.getIdCurso()%>"><%= c.getNomeCurso() + " (" + c.getTipoCurso() + ")"%></option>
                            <% }%>
                        </select>
                    </div>

                    <div class="mt-4">
                        <input type="submit" class="btn btn-primary btn-md w-100" value="<%=txtBotao%>">
                    </div>

                    <input type="hidden" name="acao" value="<%=acao%>">
                    <input type="hidden" name="idAluno" value="<%=idAluno%>">
                </form>
            </div>
        </div>
    </body>
</html>
