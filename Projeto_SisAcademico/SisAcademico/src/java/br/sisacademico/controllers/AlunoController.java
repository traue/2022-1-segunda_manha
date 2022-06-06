package br.sisacademico.controllers;

import br.sisacademico.dao.AlunoDao;
import br.sisacademico.dao.CursoDao;
import br.sisacademico.model.Aluno;
import br.sisacademico.model.Curso;
import br.sisacademico.util.AcaoDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AlunoController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        try ( PrintWriter out = response.getWriter()) {
            AcaoDao act = AcaoDao.valueOf(request.getParameter("acao"));
            AlunoDao aDAO = new AlunoDao();
            CursoDao cDAO = new CursoDao();
            HttpSession session = request.getSession();
            Aluno a;
            int idAluno;

            switch (act) {
                case LEITURA:
                    ArrayList<Aluno> alunos;
                    String url = "./relatorios/alunos.jsp";
                    if (request.getParameter("idCurso") == null) {
                        alunos = aDAO.getTodosAluno();
                    } else {
                        int idCurso = Integer.parseInt(request.getParameter("idCurso"));
                        alunos = aDAO.getTodosAluno(idCurso);
                        url += "?idCurso=" + idCurso;
                    }

                    session.setAttribute("listaDeAlunos", alunos);

                    response.sendRedirect(url);

                    break;
                case EXCLUSAO:
                    idAluno = Integer.parseInt(request.getParameter("idAluno"));
                    aDAO.deleteAluno(idAluno);
                    if (request.getParameter("idCurso") != null) {
                        int idCurso = Integer.parseInt(request.getParameter("idCurso"));
                        response.sendRedirect("./relatorios/loader.jsp?pagina=aluno&idCurso=" + idCurso);
                    } else {
                        response.sendRedirect("./relatorios/loader.jsp?pagina=aluno");
                    }

                    break;
                case CARREGAMENTO:
                    session.setAttribute("listaCursos", cDAO.getTodosCursos());

                    if (request.getParameter("idAluno") != null) {
                        String editParams = String.format("?idAluno=%s&nome=%s&ra=%s&idCurso=%s",
                                request.getParameter("idAluno"),
                                request.getParameter("nome"),
                                request.getParameter("ra"),
                                request.getParameter("idCurso"));
                        response.sendRedirect("./cadastros/aluno.jsp" + editParams);
                    } else {
                        response.sendRedirect("./cadastros/aluno.jsp");
                    }

                    break;
                case CADASTRO:
                    a = new Aluno();
                    a.setRa(Integer.parseInt(request.getParameter("raAluno")));
                    a.setNomeAluno(request.getParameter("nomeAluno"));
                    a.setCurso(new Curso(Integer.parseInt(request.getParameter("idCurso")), null, null));
                    if (aDAO.cadastraAluno(a)) {
                        response.sendRedirect("./relatorios/loader.jsp?pagina=aluno");
                    }
                    break;
                case EDICAO:
                    a = new Aluno();
                    a.setIdAluno(Integer.parseInt(request.getParameter("idAluno")));
                    a.setNomeAluno(request.getParameter("nomeAluno"));
                    a.setCurso(new Curso(Integer.parseInt(request.getParameter("idCurso")), null, null));
                    if (aDAO.atualizaAluno(a)) {
                        response.sendRedirect("./relatorios/loader.jsp?pagina=aluno");
                    }
                    break;
                default:
                    break;
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(AlunoController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(AlunoController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
