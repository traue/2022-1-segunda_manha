<%@page import="java.util.Map"%>
<%@page import="br.sisacademico.model.Curso"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    response.setContentType("text/html;charset=UTF-8");
    request.setCharacterEncoding("UTF-8");
    Map<Curso, Integer> listaDeCursos = (Map) session.getAttribute("listaDeCursos");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <jsp:include page="../menu.jsp"></jsp:include>
            <script src="../js/modal_esclusao.js"></script>
            <script>
                $(function () {
                    $('[data-toggle="tooltip"]').tooltip();
                });
            </script>

            <div class="container mt-4">
                <div class="table-responsive-md" style="width: 90%; margin: 0 auto;">
                    <table class="table justify-content-center">
                        <thead class="thead-dark">
                        <th scope="col">Curso</th>
                        <th scope="col">Tipo de Curso</th>
                        <th scope="col" class="text-center">Qtd. de Alunos</th>
                        <th scope="col" class="text-center">Ver Alunos</th>
                        <th scope="col" class="text-center">Editar</th>
                        <th scope="col" class="text-center">Excluir</th>
                        </thead>
                        <tbody>
                        <% for (Map.Entry<Curso, Integer> c : listaDeCursos.entrySet()) {%>
                        <tr>
                            <td><%=c.getKey().getNomeCurso()%></td>
                            <td><%=c.getKey().getTipoCurso()%></td>
                            <td class="text-center"><%= c.getValue()%></td>

                            <% if (c.getValue() == 0) { %>
                            <td class="text-center">
                                <span class="d-inline-block" data-toggle="tooltip" title="Sem alunos">
                                    <button class="btn btn-secondary" style="pointer-events: none;" disabled>
                                        Alunos Matriculados
                                    </button>
                                </span>
                            </td>
                            <% } else {%>
                            <td class="text-center">
                                <a class="btn btn-outline-info" href="./loader.jsp?pagina=aluno&idCurso=<%=c.getKey().getIdCurso()%>">Alunos Matriculados</a>
                            </td>
                            <% } %>

                            <%
                                String editParams = String.format("?idCurso=%s&curso=%s&tipo=%s", 
                                        c.getKey().getIdCurso(), c.getKey().getNomeCurso(), c.getKey().getTipoCurso());
                            %>
                            
                            <td class="text-center"><a class="btn btn-outline-primary" href="../cadastros/curso.jsp<%=editParams%>">Editar</a></td>

                            <% if (c.getValue() > 0) { %>
                            <td class="text-center">
                                <span class="d-inline-block" data-toggle="tooltip" title="Não é possível excluir curso com alunos">
                                    <button class="btn btn-secondary" style="pointer-events: none;" disabled>
                                        Excluir
                                    </button>
                                </span>
                            </td>
                            <% } else {%>
                            <td class="text-center">
                                <a class="btn btn-outline-danger" id="deleteCurso" href="../CursoController?acao=EXCLUSAO&idCurso=<%=c.getKey().getIdCurso()%>">Excluir</a>
                            </td>
                            <% } %>
                        </tr>
                        <% }%>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
