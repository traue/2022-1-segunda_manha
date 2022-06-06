<%@page import="br.sisacademico.model.Aluno"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    response.setContentType("text/html;charset=UTF-8");
    request.setCharacterEncoding("UTF-8");
    
    ArrayList<Aluno> alunos = (ArrayList) session.getAttribute("listaDeAlunos");

    boolean listaVazia = alunos.size() == 0;

    boolean mostraPainelFiltro
            = request.getParameter("idCurso") != null ? true : false;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <jsp:include page="../menu.jsp"></jsp:include>
            <script src="../js/modal_esclusao.js"></script>
        <% if (mostraPainelFiltro) {%>
        <div class="container mt-4 pt-4">
            <div class="card" style="width: 90%; margin: 0 auto;">
                <% if (!listaVazia) {%>
                <div class="card-header bg-dark">
                    <p class="text-white">Filtro aplicado</p>
                </div>
                <div class="card-body">
                    <h6 class="card-title">
                        Mostrando apenas alunos do curso:
                        <strong>
                            <%= alunos.get(0).getCurso().getNomeCurso()%>
                        </strong>
                    </h6>
                    <a href="loader.jsp?pagina=aluno" class="btn btn-primary">Limpar Filtro</a>
                </div>
                <% } else {%>
                <div class="card-header bg-dark">
                    <p class="text-white">Ops...</p>
                </div>
                <div class="card-body">
                    <h6 class="card-title">
                        A lista está vazia!
                    </h6>
                    <a href="loader.jsp?pagina=aluno" class="btn btn-primary">Limpar Filtro</a>
                </div>
                <% } %>
            </div>
        </div>
        <% } %>

        <div class="container mt-4">
            <div class="table-responsive-md" style="width: 90%; margin: 0 auto;">
                <table class="table justify-content-center">
                    <thead class="thead-dark">
                    <th scope="col">RA</th>
                    <th scope="col">Nome do Aluno</th>
                    <th scope="col">Curso</th>
                    <th scope="col">Tipo de Curso</th>
                    <th scope="col" class="text-center">Editar</th>
                    <th scope="col" class="text-center">Excluir</th>
                    </thead>
                    <tbody>
                        <% for (Aluno a : alunos) {%>
                        <tr>
                            <td><%=a.getRa()%></td>
                            <td><%= a.getNomeAluno()%></td>
                            <td><%= a.getCurso().getNomeCurso()%></td>
                            <td><%= a.getCurso().getTipoCurso()%></td>
                            
                            <%
                                String editParams = String.format("&idAluno=%s&nome=%s&ra=%s&idCurso=%s", 
                                        a.getIdAluno(), a.getNomeAluno(), a.getRa(), a.getCurso().getIdCurso());
                            %>
                            
                            <td class="text-center"><a class="btn btn-outline-primary" href="<%=request.getContextPath()%>/AlunoController?acao=CARREGAMENTO<%=editParams%>">Editar</a></td>

                            
                            <% if (mostraPainelFiltro) {%>
                            <td class="text-center"><a class="btn btn-outline-danger" id="deleteAluno" 
                                                       href="../AlunoController?acao=EXCLUSAO&idCurso=<%=a.getCurso().getIdCurso()%>&idAluno=<%=a.getIdAluno()%>">Excluir</a></td>
                                <% } else {%>
                            <td class="text-center"><a class="btn btn-outline-danger" id="deleteAluno" 
                                                       href="../AlunoController?acao=EXCLUSAO&idAluno=<%=a.getIdAluno()%>">Excluir</a></td>
                                <% } %>
                        </tr>
                        <% }%>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>